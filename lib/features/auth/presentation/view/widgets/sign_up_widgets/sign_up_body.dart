import 'package:flutter/material.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthHeader(title: 'Create account', subTitle: 'Fill your information below or register with your social account')
      ],
    );
  }
}
