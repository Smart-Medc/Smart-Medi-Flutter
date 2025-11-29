import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({
    super.key,
    required this.text,
    this.height = 55, // raw value because we will apply .h inside build
    this.borderRadius = 10, // same, will apply .r
    this.backgroundColor,
    this.onPressed,
  });
  final String text;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: double.infinity,
      child: Material(
        color: backgroundColor ?? AppColors.primaryLightMode,
        borderRadius: BorderRadius.circular(borderRadius.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius.r),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: AppStyles.textStyle22W700White,
            ),
          ),
        ),
      ),
    );
  }
}
