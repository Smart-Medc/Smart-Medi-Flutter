import 'package:flutter/material.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/reset_password_widgets/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email, required this.code});
  final String email;
  final String code;
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: ResetPasswordBody()));
  }
}
