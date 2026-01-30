import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class MedicalRecordsSummary extends StatelessWidget {
  const  MedicalRecordsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary',
          style: AppStyles.textStyle24W600Black,
        ),
        12.verticalSpace,
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 28.w, right: 60.w, top: 22.h, bottom: 22.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: AppShadows.small,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  summaryItem(title: 'Total Records', value: 47),
                  20.verticalSpace,
                  summaryItem(title: 'Lab Reports', value: 18),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  summaryItem(title: 'Imaging', value: 12),
                  20.verticalSpace,
                  summaryItem(title: 'Storage Used', value: 2.4),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
  Widget summaryItem({required String title, required double value}) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 30.h,
          color: AppColors.primaryColor,
        ),
        4.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.textStyle10W400LightGrey,
            ),
            Text(
              '${title != 'Storage Used' ? value.toInt() : value}${title == 'Storage Used' ? ' GB' : ''}',
              style: AppStyles.textStyle15W600Black,
            ),
          ],
        ),
      ],
    );
  }
}
