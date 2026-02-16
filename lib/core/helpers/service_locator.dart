import 'package:get_it/get_it.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/core/networking/dio_factory.dart';
import '../../features/auth/data/repos/autho_repo/auth_repo.dart';
import '../../features/auth/data/repos/autho_repo/auth_repo_impl.dart';


final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Get configured Dio instance from DioFactory
  final dio = await DioFactory.getInstance();

  getIt.registerSingleton<ApiService>(ApiService(dio));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

}
