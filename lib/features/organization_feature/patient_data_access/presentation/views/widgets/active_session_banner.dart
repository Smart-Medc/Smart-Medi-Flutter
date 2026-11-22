import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class ActiveSessionBanner extends StatelessWidget {
  const ActiveSessionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.iconBGBlue,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.access_time, color: AppColors.primaryColor, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Access Session Active', style: AppStyles.textStyle12W600Black),
                Text('Code: ABC123XY', style: AppStyles.textStyle10W400LightGrey),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('22h 55m', 
                style: AppStyles.textStyle12W600Black.copyWith(color: AppColors.iconCyan)),
              Text('Time Remaining', style: AppStyles.textStyle10W400LightGrey),
            ],
          ),
        ],
      ),
    );
  }
}
