import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_medi/core/networking/api_failure.dart';

/// A helper class to handle API calls with consistent error handling
class ApiHelper {
  /// Executes an API call and handles errors consistently
  ///
  /// Returns [Either<Failure, T>] where:
  /// - Left contains the failure (ServerFailure)
  /// - Right contains the successful result of type T
  ///
  /// Example:
  /// ```dart
  /// return ApiHelper.execute<LoginResponse>(
  ///   () async {
  ///     final data = await apiService.post(endpoint: ApiEndpoints.login, data: loginRequest.toJson());
  ///     return LoginResponse.fromJson(data);
  ///   },
  /// );
  /// ```
  static Future<Either<Failure, T>> execute<T>(
    Future<T> Function() apiCall,
  ) async {
    try {
      final result = await apiCall();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}