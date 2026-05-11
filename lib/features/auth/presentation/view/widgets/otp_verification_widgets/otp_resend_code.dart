import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/auth/data/models/email_request/email_request.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_reset_code_cubit/verify_reset_code_cubit.dart';

class OtpResendCode extends StatelessWidget {
  const OtpResendCode({super.key, required this.email, required this.isComingFromSignUp});
  final String email;
  final bool isComingFromSignUp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Didn’t you receive the OTP? ',
          style: AppStyles.textStyle14W400Black,
        ),
        InkWell(
          onTap: () {
            if (isComingFromSignUp) {
              // Email verification flow - resend verification code
              context.read<VerifyEmailCubit>().resendVerificationCode(
                emailRequest: EmailRequest(email: email),
              );
            } else {
              // Password reset flow - resend reset code
              context.read<VerifyResetCodeCubit>().resendResetCode(
                emailRequest: EmailRequest(email: email),
              );
            }
          },
          child: Text(
            'Resend OTP',
            style: AppStyles.textStyle14W400Black.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
