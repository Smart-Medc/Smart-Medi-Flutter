import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/auth/data/models/email_request/email_request.dart';
import 'package:smart_medi/features/auth/data/models/reset_password/reset_password_request.dart';
import 'package:smart_medi/features/auth/data/models/verify_reset_code/verify_reset_code_request.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo.dart';

class PasswordRecoveryRepoImpl extends PasswordRecoveryRepo {
  PasswordRecoveryRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, Unit>> forgotPassword({required EmailRequest emailRequest}) async {
    return ApiHelper.execute<Unit>(() async {
      await apiService.post(endpoint: ApiEndpoints.forgetPassword, data: emailRequest.toJson());
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> verifyResetCode({required VerifyResetCodeRequest verifyResetCodeRequest}) async {
    return ApiHelper.execute<Unit>(() async {
      await apiService.post(endpoint: ApiEndpoints.verifyPasswordResetCode, data: verifyResetCodeRequest.toJson());
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required ResetPasswordRequest resetPasswordRequest}) async {
    return ApiHelper.execute<Unit>(() async {
      await apiService.post(
        endpoint: ApiEndpoints.resetPassword,
        data: resetPasswordRequest.toJson(),
      );
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> resendResetCode({required EmailRequest emailRequest}) {
   return ApiHelper.execute<Unit>(() async {
     await apiService.post(endpoint: ApiEndpoints.resendResetCode, data: emailRequest.toJson());
     return unit;
   });
  }
}