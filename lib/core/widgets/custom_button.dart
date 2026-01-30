import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({
    super.key,
    required this.text,
    this.height = 56, // raw value because we will apply .h inside build
    this.borderRadius = 10, // same, will apply .r
    this.backgroundColor,
    this.onPressed, this.textStyle, this.boxShadow,
  });
  final String text;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius.r),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(borderRadius.r),
            boxShadow: boxShadow,
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle ?? AppStyles.textStyle24W600White,
            ),
          ),
        ),
      ),
    );
  }
}
