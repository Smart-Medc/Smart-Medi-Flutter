import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_footer.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/login_widgets/login_fields.dart';
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(25.0.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            65.verticalSpace,
            const AuthHeader(title: 'Sign in', subTitle: 'Welcome back, you‘ve been missed'),
            80.verticalSpace,
            const LoginFields(),
            40.verticalSpace,
            const AuthFooter(isLogin: true,),
        
          ],
        ),
      ),
    );
  }
}
