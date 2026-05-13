import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class MedicalRecordItem extends StatelessWidget {
  final String title;
  final String date;
  final String doctor;
  final String tag;
  final IconData icon;

  const MedicalRecordItem({
    super.key,
    required this.title,
    required this.date,
    required this.doctor,
    required this.tag,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.iconBGBlue,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: AppColors.primaryColor, size: 24.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.textStyle12W600Black),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 10.sp, color: AppColors.textLightGrey),
                    SizedBox(width: 4.w),
                    Text(date, style: AppStyles.textStyle10W400LightGrey),
                    SizedBox(width: 8.w),
                    Text('•', style: AppStyles.textStyle10W400LightGrey),
                    SizedBox(width: 8.w),
                    Text(doctor, style: AppStyles.textStyle10W400LightGrey),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.iconBGCyan,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    tag,
                    style: AppStyles.textStyle10W400TextBlue.copyWith(color: AppColors.iconCyan),
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              side: BorderSide(color: AppColors.grey),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ),
            child: Row(
              children: [
                Icon(Icons.visibility_outlined, size: 16.sp, color: AppColors.black),
                SizedBox(width: 4.w),
                Text('View', style: AppStyles.textStyle12W500Black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
