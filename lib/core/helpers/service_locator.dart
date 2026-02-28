import 'package:get_it/get_it.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/core/networking/dio_factory.dart';
import 'package:smart_medi/features/auth/data/repos/login_repo/login_repo.dart';
import 'package:smart_medi/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo_impl.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo_impl.dart';


final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Get configured Dio instance from DioFactory
  final dio = await DioFactory.getInstance();

  getIt.registerSingleton<ApiService>(ApiService(dio));

  // Auth repositories
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<RegistrationRepo>(RegistrationRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<PasswordRecoveryRepo>(PasswordRecoveryRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

}
