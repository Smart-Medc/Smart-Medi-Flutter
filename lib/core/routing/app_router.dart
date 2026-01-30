import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/auth/presentation/view/complete_profile_view.dart';
import 'package:smart_medi/features/auth/presentation/view/forget_password_view.dart';
import 'package:smart_medi/features/auth/presentation/view/login_view.dart';
import 'package:smart_medi/features/auth/presentation/view/otp_verification_view.dart';
import 'package:smart_medi/features/auth/presentation/view/reset_password_view.dart';
import 'package:smart_medi/features/auth/presentation/view/sign_up_view.dart';
import 'package:smart_medi/features/home/presentation/views/home_view.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/medical_records_view.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/record_details_view.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/edit_record_view.dart';

abstract class AppRouter {

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const EditRecordView()),
      GoRoute(path: AppRoutes.loginView, builder: (context, state) => const LoginView()),
      GoRoute(path: AppRoutes.signUpView, builder: (context, state) => const SignUpView()),
      GoRoute(path: AppRoutes.otpVerificationView, builder: (context, state) {
        final extraData = state.extra as Map<String,dynamic>;
        final bool isComingFromSignUp = extraData['isComingFromSignUp'] as bool;
        return OtpVerificationView(isComingFromSignUp: isComingFromSignUp);
      }),
      GoRoute(path: AppRoutes.forgetPasswordView, builder: (context, state) => const ForgetPasswordView()),
      GoRoute(path: AppRoutes.resetPassView, builder: (context, state) => const ResetPasswordView()),
      GoRoute(path: AppRoutes.completeProfileView, builder: (context, state) => const CompleteProfileView()),
      GoRoute(path: AppRoutes.homeView, builder: (context, state) => const HomeView()),
      GoRoute(path: AppRoutes.medicalRecords, builder: (context, state) => const MedicalRecordsView()),
      GoRoute(path: AppRoutes.recordDetailsView, builder: (context, state) => const RecordDetailsView()),
      GoRoute(path: AppRoutes.editRecordView, builder: (context, state) => const EditRecordView()),
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
