import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/auth_helper.dart';
import 'package:smart_medi/core/routing/app_routes.dart';

/// Example: How to implement route guards with GoRouter
///
/// This shows you how to protect routes and redirect unauthenticated users to login
///
/// Usage in your router configuration:
/// ```dart
/// GoRoute(
///   path: AppRoutes.homeView,
///   builder: (context, state) => const HomeView(),
///   redirect: (context, state) => AuthGuard.checkAuth(state),
/// ),
/// ```

class AuthGuard {
  AuthGuard._();

  /// Check if user is authenticated, redirect to login if not
  static Future<String?> checkAuth(GoRouterState state) async {
    final isAuthenticated = await AuthHelper.isAuthenticated();

    // If no stored session exists, redirect to login.
    // Expired access tokens are handled by the networking refresh flow.
    if (!isAuthenticated) {
      return AppRoutes.organizationAccessPatientDataView;
    }

    // Allow access to the route
    return null;
  }

  /// Prevent authenticated users from accessing login/signup
  static Future<String?> checkGuest(GoRouterState state) async {
    final isAuthenticated = await AuthHelper.isAuthenticated();

    // Keep users with a stored session inside the app.
    if (isAuthenticated) {
      return AppRoutes.organizationAccessPatientDataView;
    }

    // Allow access to login/signup
    return null;
  }
}

/// Example Router Configuration:
///
/// ```dart
/// final router = GoRouter(
///   initialLocation: AppRoutes.loginView,
///   routes: [
///     // Public routes (guest only)
///     GoRoute(
///       path: AppRoutes.loginView,
///       builder: (context, state) => const LoginView(),
///       redirect: (context, state) => AuthGuard.checkGuest(state),
///     ),
///     GoRoute(
///       path: AppRoutes.signUpView,
///       builder: (context, state) => const SignUpView(),
///       redirect: (context, state) => AuthGuard.checkGuest(state),
///     ),
///
///     // Protected routes (auth required)
///     GoRoute(
///       path: AppRoutes.homeView,
///       builder: (context, state) => const HomeView(),
///       redirect: (context, state) => AuthGuard.checkAuth(state),
///     ),
///     GoRoute(
///       path: AppRoutes.profileView,
///       builder: (context, state) => const ProfileView(),
///       redirect: (context, state) => AuthGuard.checkAuth(state),
///     ),
///   ],
/// );
/// ```

