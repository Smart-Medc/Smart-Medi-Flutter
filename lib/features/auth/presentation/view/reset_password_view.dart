import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo.dart';
import 'package:smart_medi/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/reset_password_widgets/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email, required this.code});
  final String email;
  final String code;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ResetPasswordCubit(getIt<PasswordRecoveryRepo>()),
          child: ResetPasswordBody(email: email, code: code),
        ),
      ),
    );
  }
}
