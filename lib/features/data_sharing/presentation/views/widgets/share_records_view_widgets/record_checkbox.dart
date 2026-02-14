import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class RecordCheckbox extends StatelessWidget {
  const RecordCheckbox({
    super.key,
    required this.isSelected,
    required this.onTap, this.size = 15,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.formFieldStrokeColor,
            width: 2.sp,
          ),
          color: Colors.transparent,
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: size/2.w,
                  height: size/2.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

