import 'package:dio/dio.dart';

class ApiService {

  ApiService(this.dio);
  final Dio dio;

  Future<dynamic> get(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get(endpoint, queryParameters: queryParameters);
    return response.data;
  }

  Future<dynamic> post({required String endpoint, dynamic data}) async {
    final response = await dio.post(endpoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> postWithFormData({
    required String endPoint,
    required FormData formData,
  }) async {
    var response = await dio.post(
      endPoint,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    return response.data;
  }

  Future<dynamic> put({required String endpoint, dynamic data}) async {
    final response = await dio.put(endpoint, data: data);
    return response.data;
  }

  Future<dynamic> delete(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    final response =
        await dio.delete(endpoint, queryParameters: queryParameters);
    return response.data;
  }
}
