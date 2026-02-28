import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/forget_password_wigets/forget_password_bloc_listener.dart';
class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(25.0.w),
      child: Column(
        children: [
          80.verticalSpace,
          const AuthHeader(title: 'Reset Password', subTitle: 'Enter your email'),
          56.verticalSpace,
          const ForgetPasswordBlocListener(),
        ],
      ),
    );
  }
}
