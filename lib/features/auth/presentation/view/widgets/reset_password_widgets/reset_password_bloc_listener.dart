import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/reset_password_widgets/reset_password_fields.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({
    super.key,
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showLoadingDialog(context, message: 'Resetting your password...');
        } else if (state is ResetPasswordSuccess) {
          GoRouter.of(context).pop(); // Close loading dialog
          context.showSnackBar(const Text('Password reset successfully!'));
          GoRouter.of(context).go(AppRoutes.loginView);
        } else if (state is ResetPasswordFailure) {
          GoRouter.of(context).pop(); // Close loading dialog
          context.showSnackBar(Text(state.message));
        }
      },
      child: ResetPasswordFields(email: email, code: code),
    );
  }
}