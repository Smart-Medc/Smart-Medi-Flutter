import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_email_cubit/verify_email_cubit.dart';
class OtpResendCode extends StatelessWidget {
  const OtpResendCode({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Didn’t you receive the OTP? ',
        style: AppStyles.textStyle14W400Black,
        children: [
          TextSpan(
              text: 'Resend OTP',
              style: AppStyles.textStyle14W400Black.copyWith(
                  color: AppColors.primaryColor
              ),
              recognizer: TapGestureRecognizer()..onTap = () {
                context.read<VerifyEmailCubit>().resendVerificationCode(email: email);
              }
          ),
        ],
      ),
    );
  }
}
