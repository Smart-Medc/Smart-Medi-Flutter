import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.size = 40,
    this.color,
    this.strokeWidth = 4,
  });

  final double size;
  final Color? color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.w,
        height: size.h,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth.sp,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

/// Full screen loading indicator with optional background blur
class FullScreenLoadingIndicator extends StatelessWidget {
  const FullScreenLoadingIndicator({
    super.key,
    this.message,
    this.backgroundColor,
    this.isDismissible = false,
  });

  final String? message;
  final Color? backgroundColor;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: isDismissible,
      child: Container(
        color: backgroundColor ?? Colors.black.withValues(alpha: .5),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomLoadingIndicator(),
                if (message != null) ...[
                  16.verticalSpace,
                  Text(
                    message!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlack,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Helper method to show loading dialog
void showLoadingDialog(
  BuildContext context, {
  String? message,
  bool isDismissible = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: isDismissible,
    builder: (context) => FullScreenLoadingIndicator(
      message: message,
      isDismissible: isDismissible,
    ),
  );
}

/// Helper method to hide loading dialog
void hideLoadingDialog(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}

