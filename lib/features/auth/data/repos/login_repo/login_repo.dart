import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/auth/data/models/login/login_request.dart';
import 'package:smart_medi/features/auth/data/models/login/login_response.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login({required LoginRequest loginRequest});
}