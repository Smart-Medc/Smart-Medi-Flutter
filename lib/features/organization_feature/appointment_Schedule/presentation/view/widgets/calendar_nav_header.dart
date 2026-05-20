import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// Month/date navigation row: "< January 2026 >"  + subtitle
class CalendarNavHeader extends StatelessWidget {
  final String monthYear;
  final String subtitle;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const CalendarNavHeader({
    super.key,
    required this.monthYear,
    required this.subtitle,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.formFieldStrokeColor.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous arrow
          GestureDetector(
            onTap: onPrevious,
            child: Container(
              padding: EdgeInsets.all(6.r),
              child: Icon(
                Icons.chevron_left,
                color: AppColors.textBlack,
                size: 20.sp,
              ),
            ),
          ),
          // Month + subtitle
          Column(
            children: [
              Text(
                monthYear,
                style: AppStyles.textStyle15W600Black,
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: AppStyles.textStyle10W400DarkGrey,
              ),
            ],
          ),
          // Next arrow
          GestureDetector(
            onTap: onNext,
            child: Container(
              padding: EdgeInsets.all(6.r),
              child: Icon(
                Icons.chevron_right,
                color: AppColors.textBlack,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
