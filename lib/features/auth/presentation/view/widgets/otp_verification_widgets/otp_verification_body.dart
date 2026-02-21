import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_bloc_listener.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_resend_code_bloc_listener.dart';

class OtpVerificationBody extends StatelessWidget {
  const OtpVerificationBody({super.key,required this.isComingFromSignUp, required this.email});
  final bool isComingFromSignUp;
  final String email;
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
          OtpBlocListener(isComingFromSignUp: isComingFromSignUp, email: email),
          32.verticalSpace,
          OtpResendCodeBlocListener(email: email)
        ],
      ),
    );
  }
}
