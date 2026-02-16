import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/auth/data/models/sign_up/sign_up_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> signUp({required SignUpRequestModel signUpRequestModel});
}