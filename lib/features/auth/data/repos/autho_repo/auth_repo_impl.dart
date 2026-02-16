import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/auth/data/models/sign_up/sign_up_request_model.dart';
import 'package:smart_medi/features/auth/data/repos/autho_repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{
  AuthRepoImpl({required this.apiService});

  final ApiService apiService;
  @override
  Future<Either<Failure, Unit>> signUp({required SignUpRequestModel signUpRequestModel}) async{
    try {
      await apiService.post(endpoint: ApiEndpoints.register, data: signUpRequestModel.toJson());
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  
}