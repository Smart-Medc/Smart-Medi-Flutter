import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_reset_code_cubit/verify_reset_code_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_resend_code.dart';

class ResendResetCodeBlocListener extends StatelessWidget {
  const ResendResetCodeBlocListener({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyResetCodeCubit, VerifyResetCodeState>(
      listener: (context, state) {
        if (state is ResendResetCodeLoading) {
          showLoadingDialog(context, message: 'Resending reset code to your email...');
        } else if (state is ResendResetCodeSuccess) {
          GoRouter.of(context).pop();
          context.showSnackBar(const Text('Reset code sent to your email successfully!'));
        } else if (state is ResendResetCodeFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text(state.message));
        }
      },
      child: OtpResendCode(email: email, isComingFromSignUp: false),
    );
  }
}

