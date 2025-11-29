import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_footer.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/sign_up_widgets/sign_up_fields.dart';
class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(25.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            40.verticalSpace,
            const AuthHeader(title: 'Create account', subTitle: 'Fill your information below or register with your social account'),
            30.verticalSpace,
            const SignUpFields(),
            24.verticalSpace,
            const AuthFooter(isLogin: false),
          ],
        ),
      ),
    );
  }
}
