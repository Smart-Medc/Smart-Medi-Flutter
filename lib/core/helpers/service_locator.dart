import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import '../../features/auth/data/repos/autho_repo/auth_repo.dart';
import '../../features/auth/data/repos/autho_repo/auth_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

}
