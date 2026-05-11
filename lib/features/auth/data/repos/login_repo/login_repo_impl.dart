import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/auth/data/models/login/login_request.dart';
import 'package:smart_medi/features/auth/data/models/login/login_response.dart';
import 'package:smart_medi/features/auth/data/repos/login_repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  LoginRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, LoginResponse>> login({required LoginRequest loginRequest}) async {
    return ApiHelper.execute<LoginResponse>(() async {
      final data = await apiService.post(endpoint: ApiEndpoints.login, data: loginRequest.toJson());
      return LoginResponse.fromJson(data);
    });
  }
}