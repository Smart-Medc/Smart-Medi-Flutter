import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';

abstract class AppRouter {

  static final router = GoRouter(
    routes: [
      // GoRoute(path: '/', builder: (context, state) => const SplashView()),
      // GoRoute(
      //     path: AppRoutes.onboardingView,
      //     builder: (context, state) => const OnboardingView()),
      // GoRoute(path: kHomeView, builder: (context, state) {
      //   final extraDate = state.extra as Map<String,dynamic>;
      //   final userId = extraDate['userId'] as int;
      //   final userName = extraDate['userName'] as String;
      //   return NavigationView(userId: userId, userName: userName,);
      // }),
    ],
  );
}
