import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_bloc_listener.dart';

class OtpVerificationBody extends StatelessWidget {
  const OtpVerificationBody({super.key,required this.isComingFromSignUp});
  final bool isComingFromSignUp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0.w),
      child: Column(
        children: [
          70.verticalSpace,
          const AuthHeader(
            title: 'OTP Verification',
            subTitle: 'We will send you one-time password to your email',
          ),
          30.verticalSpace,
          OtpBlocListener(isComingFromSignUp: isComingFromSignUp),
          32.verticalSpace,
          RichText(
            text: TextSpan(
              text: 'Didn’t you receive the OTP? ',
              style: AppStyles.textStyle14W400Black,
              children: [
                TextSpan(
                  text: 'Resend OTP',
                  style: AppStyles.textStyle14W400Black.copyWith(
                    color: const Color(0xff0098FF)
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {}
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
