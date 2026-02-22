import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/auth/data/models/login/login_response.dart';
import 'package:smart_medi/features/auth/data/models/sign_up/sign_up_request_model.dart';
import 'package:smart_medi/features/auth/data/models/verify_email/verify_email_request.dart';

abstract class RegistrationRepo {
  Future<Either<Failure, Unit>> signUp({required SignUpRequestModel signUpRequestModel});
  Future<Either<Failure, LoginResponse>> verifyEmail({required VerifyEmailRequest verifyEmailRequest});
  Future<Either<Failure, Unit>> resendVerificationCode({required String email});
}