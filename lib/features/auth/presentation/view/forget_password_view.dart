import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo.dart';
import 'package:smart_medi/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/forget_password_wigets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt<PasswordRecoveryRepo>()),
      child: const ForgetPasswordBody(),
    ),));
  }
}
