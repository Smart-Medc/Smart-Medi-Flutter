import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/auth/data/models/email_request/email_request.dart';
import 'package:smart_medi/features/auth/data/models/login/login_response.dart';
import 'package:smart_medi/features/auth/data/models/sign_up/sign_up_request_model.dart';
import 'package:smart_medi/features/auth/data/models/verify_email/verify_email_request.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo.dart';

class RegistrationRepoImpl extends RegistrationRepo {
  RegistrationRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, Unit>> signUp({required SignUpRequestModel signUpRequestModel}) async {
    return ApiHelper.execute<Unit>(() async {
      await apiService.post(endpoint: ApiEndpoints.register, data: signUpRequestModel.toJson());
      return unit;
    });
  }

  @override
  Future<Either<Failure, LoginResponse>> verifyEmail({required VerifyEmailRequest verifyEmailRequest}) async {
    return ApiHelper.execute<LoginResponse>(() async {
      final data = await apiService.post(endpoint: ApiEndpoints.verifyEmail, data: verifyEmailRequest.toJson());
      return LoginResponse.fromJson(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> resendVerificationCode({required EmailRequest emailRequest}) async {
    return ApiHelper.execute<Unit>(() async {
      await apiService.post(endpoint: ApiEndpoints.resendVerificationCode, data: emailRequest.toJson());
      return unit;
    });
  }
}