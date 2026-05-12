import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';


class WeeklyProgress extends StatelessWidget {
  const WeeklyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This Week',
            style: AppStyles.textStyle15W600Black,
          ),
          SizedBox(height: 20.h),
          _buildProgressRow(
            label: 'Appointments',
            value: '84 / 100',
            progress: 0.84,
            color: AppColors.iconBlue,
          ),
          SizedBox(height: 16.h),
          _buildProgressRow(
            label: 'Capacity',
            value: '78%',
            progress: 0.78,
            color: AppColors.iconCyan,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressRow({
    required String label,
    required String value,
    required double progress,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppStyles.textStyle12W500DarkGrey,
            ),
            Text(
              value,
              style: AppStyles.textStyle12W500Black,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.greyBackgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8.h,
          ),
        ),
      ],
    );
  }
}
