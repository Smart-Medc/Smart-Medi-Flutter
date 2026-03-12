import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class HomeMedicationReminder extends StatelessWidget {
  const HomeMedicationReminder({
    super.key,
    required this.medicationName,
    required this.dosage,
    required this.time,
    this.onMarkTaken,
    this.onSnooze,
  });

  final String medicationName;
  final String dosage;
  final String time;
  final VoidCallback? onMarkTaken;
  final VoidCallback? onSnooze;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.iconCyan,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: AppShadows.card,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 22.w, top: 16.h, bottom: 26.h),
        margin: EdgeInsets.only(left: 6.w),
        decoration: BoxDecoration(
          color: AppColors.iconBGCyan,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.access_time, color: AppColors.iconCyan, size: 24.sp),
                6.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Medication Reminder',
                        style: AppStyles.textStyle12W500Black,
                      ),
                      4.verticalSpace,
                      Text(
                        'Take $medicationName $dosage at $time',
                        style: AppStyles.textStyle10W400DarkGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Row(
              children: [
                InkWell(
                  onTap: onMarkTaken ?? () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.textWhite,
                      boxShadow: AppShadows.small,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Text('Mark as Taken', style: AppStyles.textStyle10W400Black),
                  ),
                ),
                18.horizontalSpace,
                TextButton(
                  onPressed: onSnooze ?? () {},
                  child: Text('Snooze', style: AppStyles.textStyle10W400Black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
