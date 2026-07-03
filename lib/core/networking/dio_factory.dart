import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dioInstance;

  static bool _isRefreshing = false;
  static Future<void>? _refreshFuture;

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

      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Client-Type': 'Mobile',
      };

      _addInterceptors(dio);

      _dioInstance = dio;
    }

    return _dioInstance!;
  }

  static void _addInterceptors(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageHelper.getAccessToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },

        onError: (error, handler) async {
          final requestOptions = error.requestOptions;

          /// Not 401 → pass through
          if (error.response?.statusCode != 401) {
            return handler.next(error);
          }

          /// Already retried once → stop loop
          if (requestOptions.extra[_refreshRetriedExtraKey] == true) {
            return handler.next(error);
          }

          /// Avoid refresh endpoint loop
          if (requestOptions.path.contains(ApiEndpoints.refreshToken)) {
            await SecureStorageHelper.clearAll();
            return handler.next(error);
          }

          try {
            /// Start refresh only once
            if (!_isRefreshing) {
              _isRefreshing = true;
              _refreshFuture = _performRefresh();
            }

            await _refreshFuture;
          } catch (e) {
            await SecureStorageHelper.clearAll();
            return handler.next(error);
          } finally {
            if (_isRefreshing) {
              _isRefreshing = false;
              _refreshFuture = null;
            }
          }

          /// Get new token
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
            receiveDataWhenStatusError:
            requestOptions.receiveDataWhenStatusError,
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
            if (kDebugMode) {
              print("Retry failed: $e");
            }
            return handler.next(error);
          }
        },
      ),
    );

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

  /// ================= REFRESH TOKEN =================
  static Future<void> _performRefresh() async {
    final refreshDio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {'Accept': 'application/json'},
      ),
    );

    final refreshToken = await SecureStorageHelper.getRefreshToken();

    if (refreshToken == null || refreshToken.isEmpty) {
      throw Exception('Missing refresh token');
    }

    final response = await refreshDio.post(
      ApiEndpoints.refreshToken,
      data: {
        'refreshToken': refreshToken,
      },
    );

    if (response.statusCode != 200 || response.data == null) {
      throw Exception('Refresh token failed');
    }

    final payload = response.data as Map<String, dynamic>;

    if (payload['data'] == null || payload['data'] is! Map<String, dynamic>) {
      throw Exception('Invalid refresh response');
    }

    final data = payload['data'] as Map<String, dynamic>;

    final newAccessToken = data['accessToken']?.toString();
    final newRefreshToken = data['refreshToken']?.toString();

    if (newAccessToken == null || newAccessToken.isEmpty) {
      throw Exception('Missing access token');
    }

    await SecureStorageHelper.saveAccessToken(newAccessToken);

    if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
      await SecureStorageHelper.saveRefreshToken(newRefreshToken);
    }

    final expiresAt = data['accessTokenExpiresAt']?.toString();

    if (expiresAt != null && expiresAt.isNotEmpty) {
      await SecureStorageHelper.saveAccessTokenExpiresAt(expiresAt);
    }
  }
}