import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_verification_body.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key, required this.isComingFromSignUp, required this.email});

  final bool isComingFromSignUp;
  final String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => VerifyEmailCubit(getIt<RegistrationRepo>()),
          child: OtpVerificationBody(isComingFromSignUp: isComingFromSignUp, email: email),
        ),
      ),
    );
  }
}
