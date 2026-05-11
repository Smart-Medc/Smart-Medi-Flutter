import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/reset_password_widgets/reset_password_bloc_listener.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key, required this.email, required this.code});

  final String email;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            80.verticalSpace,
            const AuthHeader(title: 'Reset Password', subTitle: 'Please Enter Your New Password'),
            58.verticalSpace,
            ResetPasswordBlocListener(email: email, code: code),
          ],
        ),
      ),
    );
  }
}
