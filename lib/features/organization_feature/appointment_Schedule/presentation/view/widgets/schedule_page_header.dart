import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// Header section: "Appointment Schedule" title + Export/Print buttons
class SchedulePageHeader extends StatelessWidget {
  const SchedulePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appointment\nSchedule',
                  style: AppStyles.textStyle24W700Black,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Stay updated with your health\nactivities',
                  style: AppStyles.textStyle10W400DarkGrey,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          // Export + Print buttons column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _HeaderActionButton(
                icon: Icons.upload_outlined,
                label: 'Export',
                onTap: () {},
              ),
              SizedBox(height: 8.h),
              _HeaderActionButton(
                icon: Icons.print_outlined,
                label: 'Print',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Reusable Export / Print button
class _HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _HeaderActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.formFieldStrokeColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14.sp, color: AppColors.textBlack),
            SizedBox(width: 6.w),
            Text(label, style: AppStyles.textStyle12W500Black),
          ],
        ),
      ),
    );
  }
}
