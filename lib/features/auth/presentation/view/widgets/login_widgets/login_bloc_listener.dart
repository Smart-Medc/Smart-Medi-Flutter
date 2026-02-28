import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/login_widgets/login_fields.dart';
class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          showLoadingDialog(context, message: 'Logging you in...');
        } else if (state is LoginSuccess) {
          // Save login data to secure storage
          await SecureStorageHelper.saveLoginData(
            accessToken: state.loginResponse.data.accessToken,
            accessTokenExpiresAt: state.loginResponse.data.accessTokenExpiresAt,
            userId: state.loginResponse.data.user.id,
            userEmail: state.loginResponse.data.user.email,
            userType: state.loginResponse.data.user.userType,
            userName: state.loginResponse.data.user.firstName
          );

          if (context.mounted) {
            GoRouter.of(context).pop();
            GoRouter.of(context).pushReplacement(AppRoutes.homeView);
            context.showSnackBar(const Text('Login Successful'));
          }
        } else if (state is LoginFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text('Login Failed: ${state.message}'));
        }
      },
      child: const LoginFields(),
    );
  }
}
