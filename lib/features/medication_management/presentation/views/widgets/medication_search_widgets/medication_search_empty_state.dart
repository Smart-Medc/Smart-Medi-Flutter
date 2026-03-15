import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class MedicationSearchEmptyState extends StatelessWidget {
  const MedicationSearchEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72.w,
              height: 72.h,
              decoration: const BoxDecoration(
                color: AppColors.formFieldBGColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.textLightGrey,
                size: 32.sp,
              ),
            ),
            16.verticalSpace,
            Text(
              title,
              style: AppStyles.textStyle15W600Black,
              textAlign: TextAlign.center,
            ),
            6.verticalSpace,
            Text(
              subtitle,
              style: AppStyles.textStyle12W400DarkGrey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

