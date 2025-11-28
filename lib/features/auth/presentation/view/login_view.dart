import 'package:flutter/material.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/login_widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: LoginBody()));
  }
}
