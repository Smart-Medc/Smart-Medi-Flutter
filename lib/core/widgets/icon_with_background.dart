import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IconWithBackground extends StatelessWidget {
  const IconWithBackground({super.key, required this.icon, required this.backgroundColor, required this.iconColor});
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Icon(
        icon,
        size: 24.sp,
        color: iconColor,
      ),
    );
  }
}
