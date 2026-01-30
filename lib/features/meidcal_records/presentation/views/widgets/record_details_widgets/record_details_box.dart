import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class RecordDetailsBox extends StatelessWidget {
  const RecordDetailsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.formFieldStrokeColor),
        boxShadow: AppShadows.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Record Details',style: AppStyles.textStyle24W600Black,),
          20.verticalSpace,
          recordDetailsBoxItem(title: 'Exam Date', value: 'March 10, 2024'),
          8.verticalSpace,
          recordDetailsBoxItem(title: 'Radiologist', value: 'Dr. Michael Chen'),
          8.verticalSpace,
          recordDetailsBoxItem(title: 'Facility', value: 'Radiology Center'),
          8.verticalSpace,
          recordDetailsBoxItem(title: 'Status', value: 'Report Complete'),
        ],
      ),
    );
  }
  Widget recordDetailsBoxItem({required String title, required String value}) {
    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.greyBackgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.formFieldStrokeColor,
          width: .5.w,
        )
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            21.horizontalSpace,
            Text(title,style: AppStyles.textStyle10W400LightGrey,),
            Spacer(),
            Text(value,style: AppStyles.textStyle11W500Black,),
            10.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
