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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: AppStyles.textStyle14W400Black,
            ),
            InkWell(
              onTap: () {
                if (isLogin) {
                  _showSignUpTypeSheet(context);
                } else {
                  GoRouter.of(context).replace(AppRoutes.loginView);
                }
              },
              child: Text(
                isLogin ? 'Sign up' : 'Login',
                style: AppStyles.textStyle18W700Black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showSignUpTypeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign up as',
                style: AppStyles.textStyle20W400Black.copyWith(fontWeight: FontWeight.w700),
              ),
              16.verticalSpace,
              _SignUpTypeOption(
                icon: Icons.person_outline,
                title: 'Patient',
                subtitle: 'Book appointments and manage your health',
                onTap: () {
                  Navigator.pop(sheetContext);
                  GoRouter.of(context).replace(AppRoutes.signUpView);
                },
              ),
              12.verticalSpace,
              _SignUpTypeOption(
                icon: Icons.local_hospital_outlined,
                title: 'Organization',
                subtitle: 'Register your clinic, hospital, or practice',
                onTap: () {
                  Navigator.pop(sheetContext);
                  GoRouter.of(context).replace(AppRoutes.organizationSignUpView);
                },
              ),
              8.verticalSpace,
            ],
          ),
        );
      },
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

class _SignUpTypeOption extends StatelessWidget {
  const _SignUpTypeOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: const Color(0xFF2563EB)),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.textStyle18W700Black),
                  2.verticalSpace,
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}