import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// A reusable status badge widget that displays text with a colored background.
///
/// Common use cases:
/// - Notification status (New, Read)
/// - Share status (Active, Expired, Revoked)
/// - Record status (Draft, Completed, etc.)
class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.textStyle,
    this.padding,
    this.borderRadius,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(999.r),
      ),
      child: Text(
        text,
        style: textStyle ?? AppStyles.textStyle10W400White.copyWith(color: textColor),
      ),
    );
  }
}

