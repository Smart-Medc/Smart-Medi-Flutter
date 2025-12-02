import 'package:flutter/material.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_verification_body.dart';
class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: OtpVerificationBody(),));
  }
}
