import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dioInstance;

  /// Prevents multiple refresh calls from running at the same time
  static bool _isRefreshing = false;

  /// Shared future used by all requests waiting for the same refresh process
  static Future<void>? _refreshFuture;

  /// Extra key used to ensure each request is retried after refresh only once.
  static const String _refreshRetriedExtraKey = 'refreshRetried';

  static Future<Dio> getInstance() async {
    if (_dioInstance == null) {
      final dio = Dio();
      const timeout = Duration(seconds: 30);

      dio
        ..options.baseUrl = ApiEndpoints.baseUrl
        ..options.receiveTimeout = timeout
        ..options.connectTimeout = timeout
        ..options.sendTimeout = timeout;

      /// Default headers for all requests
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        // 'X-Client-Type': 'Mobile',
      };

      _addInterceptors(dio);

      _dioInstance = dio;
    }

    return _dioInstance!;
  }

  static void _addInterceptors(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        /// ================= REQUEST =================
        /// Automatically attach the latest access token to every request
        onRequest: (options, handler) async {
          final token = await SecureStorageHelper.getAccessToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },

        /// ================= ERROR =================
        /// Handle token expiration (401) and perform automatic refresh
        onError: (error, handler) async {
          final requestOptions = error.requestOptions;

          /// If the error is not 401, just pass it through
          if (error.response?.statusCode != 401) {
            return handler.next(error);
          }

          /// Prevent endless refresh/retry loops for the same request.
          if (requestOptions.extra[_refreshRetriedExtraKey] == true) {
            return handler.next(error);
          }

          /// If this request is already the refresh call, avoid infinite loop
          if (error.requestOptions.path.contains(ApiEndpoints.refreshToken)) {
            await SecureStorageHelper.clearAll();
            return handler.next(error);
          }

          try {
            /// If no refresh is currently running, start one
            if (!_isRefreshing) {
              _isRefreshing = true;
              _refreshFuture = _performRefresh();
            }

            /// All failed requests wait for the same refresh process
            await _refreshFuture;
          } catch (e) {
            /// If refresh fails -> clear session (force logout)
            await SecureStorageHelper.clearAll();
            return handler.next(error);
          } finally {
            _isRefreshing = false;
            _refreshFuture = null;
          }

          /// Retry the original request using the new token
          final newToken = await SecureStorageHelper.getAccessToken();
          if (newToken == null || newToken.isEmpty) {
            return handler.next(error);
          }

          final options = Options(
            method: requestOptions.method,
            headers: {
              ...requestOptions.headers,
              'Authorization': 'Bearer $newToken',
            },
            responseType: requestOptions.responseType,
            contentType: requestOptions.contentType,
            sendTimeout: requestOptions.sendTimeout,
            receiveTimeout: requestOptions.receiveTimeout,
            followRedirects: requestOptions.followRedirects,
            validateStatus: requestOptions.validateStatus,
            receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
            extra: {
              ...requestOptions.extra,
              _refreshRetriedExtraKey: true,
            },
          );

          try {
            final response = await dio.request(
              requestOptions.path,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
              options: options,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
            );

            return handler.resolve(response);
          } catch (e) {
            return handler.next(error);
          }
        },
      ),
    );

    /// Pretty logger for debugging network calls
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  /// ================= REFRESH TOKEN CALL =================
  /// Calls the refresh-token endpoint and stores the new token securely
  static Future<void> _performRefresh() async {
    /// Use a separate Dio instance to avoid interceptor recursion
    final refreshDio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {'Accept': '*/*'},
      ),
    );

    final token = await SecureStorageHelper.getAccessToken();

    final response = await refreshDio.post(
      ApiEndpoints.refreshToken,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode != 200 || response.data == null) {
      throw Exception('Refresh token failed');
    }

    if (response.data is! Map<String, dynamic>) {
      throw Exception('Invalid refresh response format');
    }

    final payload = response.data as Map<String, dynamic>;
    final nestedData = payload['data'];
    final tokenContainer = nestedData is Map<String, dynamic> ? nestedData : payload;

    final newAccessToken =
        (tokenContainer['accessToken'] ?? tokenContainer['token'])?.toString();
    if (newAccessToken == null || newAccessToken.isEmpty) {
      throw Exception('Refresh response missing access token');
    }

    final expiresAt =
        (tokenContainer['accessTokenExpiresAt'] ?? tokenContainer['expiresAt'])
            ?.toString();

    await SecureStorageHelper.saveAccessToken(newAccessToken);
    if (expiresAt != null && expiresAt.isNotEmpty) {
      await SecureStorageHelper.saveAccessTokenExpiresAt(expiresAt);
    }
  }
}