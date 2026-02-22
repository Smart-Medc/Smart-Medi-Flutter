import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_reset_code_cubit/verify_reset_code_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/otp_verification_widgets/otp_fields.dart';

class VerifyResetCodeBlocListener extends StatelessWidget {
  const VerifyResetCodeBlocListener({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyResetCodeCubit, VerifyResetCodeState>(
      listener: (context, state) {
        if (state is VerifyResetCodeLoading) {
          showLoadingDialog(context, message: 'Verifying reset code...');
        } else if (state is VerifyResetCodeSuccess) {
          GoRouter.of(context).pop(); // Close loading dialog
          context.showSnackBar(const Text('Code verified successfully!'));
          GoRouter.of(context).push(AppRoutes.resetPassView, extra: {
            'email': email,
            'code': state.code,
          });
        } else if (state is VerifyResetCodeFailure) {
          GoRouter.of(context).pop(); // Close loading dialog
          context.showSnackBar(Text(state.message));
        }
      },
      child: OtpFields(isComingFromSignUp: false, email: email),
    );
  }
}

