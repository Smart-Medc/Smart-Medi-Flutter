import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';

/// A reusable card container widget with consistent styling across the app.
///
/// This widget provides a white background with border, rounded corners,
/// and a standard shadow. It's commonly used for cards and content sections.
class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius,
    this.borderColor = AppColors.formFieldStrokeColor,
    this.backgroundColor = Colors.white,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color borderColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        border: Border.all(color: borderColor),
        boxShadow: AppShadows.card,
      ),
      child: child,
    );
  }
}

