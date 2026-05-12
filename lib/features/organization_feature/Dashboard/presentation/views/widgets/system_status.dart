import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SystemStatus extends StatelessWidget {
  const SystemStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.iconBGBlue,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.primaryLightColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.trending_up_outlined,
              color: AppColors.iconBlue,
              size: 24.w,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'System Status',
                  style: AppStyles.textStyle12W600Black,
                ),
                SizedBox(height: 4.h),
                Text(
                  'All system operational, Last Backup 1 hour ago',
                  style: AppStyles.textStyle10W400DarkGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
