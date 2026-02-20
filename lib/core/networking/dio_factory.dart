import 'package:dio/dio.dart';
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
          /// If the error is not 401, just pass it through
          if (error.response?.statusCode != 401) {
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
            _isRefreshing = false;
            await SecureStorageHelper.clearAll();
            return handler.next(error);
          }

          _isRefreshing = false;

          /// Retry the original request using the new token
          final newToken = await SecureStorageHelper.getAccessToken();
          final requestOptions = error.requestOptions;

          final options = Options(
            method: requestOptions.method,
            headers: {
              ...requestOptions.headers,
              'Authorization': 'Bearer $newToken',
            },
          );

          try {
            final response = await dio.request(
              requestOptions.path,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
              options: options,
            );

            return handler.resolve(response);
          } catch (e) {
            return handler.next(error);
          }
        },
      ),
    );

    /// Pretty logger for debugging network calls
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

    /// Adjust keys below to match your API response structure
    final data = response.data['data'];

    final newAccessToken = data['accessToken'];
    final expiresAt = data['accessTokenExpiresAt'];

    await SecureStorageHelper.saveAccessToken(newAccessToken);
    await SecureStorageHelper.saveAccessTokenExpiresAt(expiresAt);
  }
}