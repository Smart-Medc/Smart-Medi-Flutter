import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/auth/data/repos/auth_repo/auth_repo.dart';
import 'package:smart_medi/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/sign_up_widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SignUpCubit(getIt<AuthRepo>()),
          child: const SignUpBody(),
        ),
      ),
    );
  }
}
