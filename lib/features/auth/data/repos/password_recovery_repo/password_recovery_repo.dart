import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/auth/data/models/email_request/email_request.dart';
import 'package:smart_medi/features/auth/data/models/reset_password/reset_password_request.dart';
import 'package:smart_medi/features/auth/data/models/verify_reset_code/verify_reset_code_request.dart';

abstract class PasswordRecoveryRepo {
  Future<Either<Failure, Unit>> forgotPassword({required EmailRequest emailRequest});
  Future<Either<Failure, Unit>> verifyResetCode({required VerifyResetCodeRequest verifyResetCodeRequest});
  Future<Either<Failure, Unit>> resetPassword({required ResetPasswordRequest resetPasswordRequest});
  Future<Either<Failure, Unit>> resendResetCode({required EmailRequest emailRequest});
}