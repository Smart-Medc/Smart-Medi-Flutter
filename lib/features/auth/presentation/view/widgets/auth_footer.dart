import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_images.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key, required this.isLogin,});
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(thickness: 1.sp,color: Colors.black,)),
            5.horizontalSpace,
            Text('or',style: AppStyles.textStyle20W400Black,),
            5.horizontalSpace,
            Expanded(child: Divider(thickness: 1.sp,color: Colors.black,)),
          ],
        ),
        30.verticalSpace,
        authFooterContainer(text: '${isLogin ? 'Login' : 'Sign up'} with Google',icon: AppImages.googleIcon),
        16.verticalSpace,
        authFooterContainer(text: '${isLogin ? 'Login' : 'Sign up'} with Facebook', icon: AppImages.facebookIcon),
        20.verticalSpace,
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Don't have an account? ",
                style: AppStyles.textStyle14W400Black,
              ),
              TextSpan(
                text: isLogin ? 'Sign up' : 'Login',
                style: AppStyles.textStyle18W700Black,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    isLogin ? GoRouter.of(context).pushReplacement(AppRoutes.signUpView) : GoRouter.of(context).pushReplacement(AppRoutes.loginView);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container authFooterContainer({required String text,required String icon}) {
    return Container(
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black.withAlpha(26))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,height: 30.sp,width: 30.sp,),
            10.horizontalSpace,
            Text(text,style: AppStyles.textStyle20W400Black,)
          ],
        ),
      );
  }
}
