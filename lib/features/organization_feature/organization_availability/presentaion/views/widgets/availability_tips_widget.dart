import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AvailabilityTipsWidget extends StatelessWidget {
  const AvailabilityTipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.iconBGBlue,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryLightColor),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.primaryColor, size: 18.sp),
              SizedBox(width: 8.w),
              Text('Availability Tips', style: AppStyles.textStyle15W600Black),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '• Changes take effect immediately for new appointment requests\n'
            '• Past time slots are automatically marked as unavailable\n'
            '• You can set multiple time blocks per day for flexible scheduling\n'
            '• Booked appointments will remain even if you change your availability',
            style: AppStyles.textStyle12W400DarkGrey,
          ),
        ],
      ),
    );
  }
}