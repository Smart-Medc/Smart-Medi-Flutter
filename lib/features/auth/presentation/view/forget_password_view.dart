import 'package:flutter/material.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/forget_password_wigets/forget_password_body.dart';
class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: ForgetPasswordBody(),));
  }
}
