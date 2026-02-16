import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dioInstance;
  // static String? _authToken; // Unused - no authentication implemented yet

  static Future<Dio> getInstance() async {
    if (_dioInstance == null) {
      final dio = Dio();
      const timeout = Duration(seconds: 30);

      dio
        ..options.baseUrl = ApiEndpoints.baseUrl
        ..options.receiveTimeout = timeout
        ..options.connectTimeout = timeout
        ..options.sendTimeout = timeout;
      // disable SSl check
      // (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      //   final client = HttpClient();
      //   client.badCertificateCallback =
      //       (X509Certificate cert, String host, int port) => true;
      //   return client;
      // };

      // Set default headers
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json', // todo can be edited later if we need to send form data or other types of data
      };

      // await setDefaultHeaders(dio); // Commented - method is commented out
      addInterceptors(dio);

      _dioInstance = dio;
    }
    return _dioInstance!;
  }

  // static Future<void> setDefaultHeaders(Dio dio) async {
  //   _authToken = await SharedPrefHelper.getString(key: SharedPrefKeys.token);
  //
  //   dio.options.headers = {
  //     'Accept': 'application/json',
  //     if (_authToken.isNotNullOrEmpty()) 'Authorization': 'Bearer $_authToken',
  //   };
  // }

  // static void updateAuthToken(String token) {
  //   _authToken = token;
  //   if (_dioInstance != null) {
  //     _dioInstance!.options.headers['Authorization'] = 'Bearer $token';
  //   }
  // }

  static void addInterceptors(Dio dio) {
    // Token interceptor - commented until authentication is implemented
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       if (_authToken.isNotNullOrEmpty()) {
    //         options.headers['Authorization'] = 'Bearer $_authToken';
    //       }
    //       return handler.next(options);
    //     },
    //   ),
    // );

    // Add basic logging interceptor
    // dio.interceptors.add(
    //   LogInterceptor(
    //     requestBody: true,
    //     requestHeader: true,
    //     responseBody: true,
    //     responseHeader: true,
    //     error: true,
    //   ),
    // );

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
}
