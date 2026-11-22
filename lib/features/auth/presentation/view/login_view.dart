import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/auth/data/repos/login_repo/login_repo.dart';
import 'package:smart_medi/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/login_widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(getIt<LoginRepo>()),
          child: const LoginBody(),
        ),
      ),
    );
  }
}
