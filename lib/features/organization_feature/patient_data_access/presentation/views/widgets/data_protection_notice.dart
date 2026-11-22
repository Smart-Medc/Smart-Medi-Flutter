import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class DataProtectionNotice extends StatelessWidget {
  const DataProtectionNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.iconBGRed,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.iconRed.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: AppColors.iconRed, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Data Protection Notice', 
                  style: AppStyles.textStyle12W600Black.copyWith(color: AppColors.iconRed)),
                SizedBox(height: 4.h),
                Text(
                  'This data is view-only and cannot be downloaded, modified, or exported. All access is logged and monitored.',
                  style: AppStyles.textStyle10W400LightGrey.copyWith(color: AppColors.iconRed.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
