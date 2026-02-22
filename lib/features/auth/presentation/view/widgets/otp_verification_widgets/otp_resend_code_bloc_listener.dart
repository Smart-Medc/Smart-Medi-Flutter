import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_resend_code.dart';
class OtpResendCodeBlocListener extends StatelessWidget {
  const OtpResendCodeBlocListener({super.key, required this.email, required this.isComingFromSignUp});
  final String email;
  final bool isComingFromSignUp;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) async {
        if (state is ResendCodeLoading) {
          showLoadingDialog(context, message: 'Resending OTP to your email...');
        } else if (state is ResendCodeSuccess) {
            GoRouter.of(context).pop();
            context.showSnackBar(const Text('Verification code sent to your email Successfully!'));
        } else if (state is ResendCodeFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text(state.message));
        }
      },
      child: OtpResendCode(email: email, isComingFromSignUp: isComingFromSignUp),
    );
  }
}
