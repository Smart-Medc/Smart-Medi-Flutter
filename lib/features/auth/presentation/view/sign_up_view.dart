import 'package:flutter/material.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/sign_up_widgets/sign_up_body.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: SignUpBody()));
  }
}
