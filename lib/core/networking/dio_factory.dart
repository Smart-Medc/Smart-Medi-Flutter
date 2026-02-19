import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dioInstance;

  static Future<Dio> getInstance() async {
    if (_dioInstance == null) {
      final dio = Dio();
      const timeout = Duration(seconds: 30);

      dio
        ..options.baseUrl = ApiEndpoints.baseUrl
        ..options.receiveTimeout = timeout
        ..options.connectTimeout = timeout
        ..options.sendTimeout = timeout;

      // Set default headers
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      addInterceptors(dio);

      _dioInstance = dio;
    }
    return _dioInstance!;
  }

  static void addInterceptors(Dio dio) {
    // Token interceptor - Automatically adds Bearer token to requests
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Get token from secure storage
          final token = await SecureStorageHelper.getAccessToken();

          // Add token to headers if available
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (error, handler) async {
          // Handle 401 Unauthorized - token expired or invalid
          if (error.response?.statusCode == 401) {
            // Clear stored auth data
            await SecureStorageHelper.clearAll();
            // You can add navigation to login screen here if needed
          }

          return handler.next(error);
        },
      ),
    );

    // PrettyDioLogger - Beautiful formatted logging
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

  // Method to update token in existing Dio instance
  static Future<void> refreshToken() async {
    // This will force the interceptor to get the new token on next request
    // No action needed - interceptor always gets fresh token
  }
}

