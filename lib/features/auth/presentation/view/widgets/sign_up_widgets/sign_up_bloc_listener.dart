import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/sign_up_widgets/sign_up_fields.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        } else if (state is SignUpSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(AppRoutes.otpVerificationView,extra: {
            'isComingFromSignUp' : true,
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign Up Successful'))
          );
        } else if (state is SignUpFailure) {
          GoRouter.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Sign Up Failed: ${state.message}'),
              duration: const Duration(seconds: 5),
            ),
          );
        }
      },
      child: const SignUpFields(),
    );
  }
}
