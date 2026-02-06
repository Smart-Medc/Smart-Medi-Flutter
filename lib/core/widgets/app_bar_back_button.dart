import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0.h),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Icon(Icons.arrow_back_sharp, size: 40.sp),
      ),
    );
  }
}
