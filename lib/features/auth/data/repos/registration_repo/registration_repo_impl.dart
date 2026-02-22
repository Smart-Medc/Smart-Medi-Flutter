import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/auth/data/models/login/login_response.dart';
import 'package:smart_medi/features/auth/data/models/sign_up/sign_up_request_model.dart';
import 'package:smart_medi/features/auth/data/models/verify_email/verify_email_request.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo.dart';

class RegistrationRepoImpl extends RegistrationRepo {
  RegistrationRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, Unit>> signUp({required SignUpRequestModel signUpRequestModel}) async {
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

  @override
  Future<Either<Failure, LoginResponse>> verifyEmail({required VerifyEmailRequest verifyEmailRequest}) async {
    try {
      final data = await apiService.post(endpoint: ApiEndpoints.verifyEmail, data: verifyEmailRequest.toJson());
      final loginResponse = LoginResponse.fromJson(data);
      return right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> resendVerificationCode({required String email}) async {
    try {
      await apiService.post(endpoint: ApiEndpoints.resendVerificationCode, data: {'email': email});
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