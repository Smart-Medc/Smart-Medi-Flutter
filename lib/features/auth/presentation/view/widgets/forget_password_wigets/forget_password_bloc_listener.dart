import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/forget_password_wigets/forget_password_field.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) async {
        if (state is ForgetPasswordLoading) {
          showLoadingDialog(context, message: 'Sending OTP to your email...');
        } else if (state is ForgetPasswordSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).push(AppRoutes.otpVerificationView, extra: {
            'isComingFromSignUp': false,
            'email': state.email,
          });
          context.showSnackBar(
            const Text('Verification code sent to your email Successfully!'),
          );
        } else if (state is ForgetPasswordFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text(state.message));
        }
      },
      child: const ForgetPasswordField(),
    );
  }
}
