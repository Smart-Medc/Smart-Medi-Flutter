import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_fields.dart';

class OtpBlocListener extends StatelessWidget {
  const OtpBlocListener({
    super.key,
    required this.isComingFromSignUp,
    required this.email,
  });

  final bool isComingFromSignUp;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) async {
        if (state is VerifyEmailLoading) {
          showLoadingDialog(context, message: 'Verifying OTP...');
        } else if (state is VerifyEmailSuccess) {
          // Save login data to secure storage
          await SecureStorageHelper.saveLoginData(
            accessToken: state.loginResponse.data.accessToken,
            accessTokenExpiresAt: state.loginResponse.data.accessTokenExpiresAt,
            userId: state.loginResponse.data.user.id,
            userEmail: state.loginResponse.data.user.email,
            userType: state.loginResponse.data.user.userType,
            patientId: state.loginResponse.data.user.patientId,
            userName: state.loginResponse.data.user.firstName,
          );

          if (context.mounted) {
            GoRouter.of(context).pop();
            isComingFromSignUp
                ? GoRouter.of(
                    context,
                  ).pushReplacement(AppRoutes.completeProfileView)
                : GoRouter.of(context).pushReplacement(AppRoutes.resetPassView);
            context.showSnackBar(const Text('OTP Verified Successfully!'));
          }
        } else if (state is VerifyEmailFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text(state.message));
        }
      },
      child: OtpFields(isComingFromSignUp: isComingFromSignUp, email: email),
    );
  }
}
