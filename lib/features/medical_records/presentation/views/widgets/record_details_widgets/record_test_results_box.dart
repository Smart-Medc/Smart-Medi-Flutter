import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';

class RecordTestResultsBox extends StatelessWidget {
  const RecordTestResultsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Test Result',style: AppStyles.textStyle24W600Black,),
          20.verticalSpace,
          testResultItem(
            title: 'Hemoglobin',
            value: '14.5 g/dL',
            reference: 'Reference: 13.5-17.5 g/dL',
            status: 'Normal',
          ),
          12.verticalSpace,
          testResultItem(
            title: 'White Blood Cells',
            value: '7.2 K/μL',
            reference: 'Reference: 4.5-11.0 K/μL',
            status: 'Normal',
          ),
          12.verticalSpace,
          testResultItem(
            title: 'Plateles',
            value: '250 K/μL',
            reference: 'Reference: 150-400 K/μL',
            status: 'Normal',
          ),
          12.verticalSpace,
          testResultItem(
            title: 'Glucose',
            value: '95 mg/dL',
            reference: 'Reference: 70-100 mg/dL',
            status: 'Normal',
          ),
          12.verticalSpace,
          testResultItem(
            title: 'Total Cholesterol',
            value: '185 mg/dL',
            reference: 'Reference: <200 mg/dL',
            status: 'Normal',
          ),
        ],
      ),
    );
  }
  Widget testResultItem({
    required String title,
    required String value,
    required String reference,
    required String status,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.formFieldBGColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppStyles.textStyle15W600Black),
              Text(value, style: AppStyles.textStyle15W600Black),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(reference, style: AppStyles.textStyle12W400DarkGrey),
              Text(status, style: AppStyles.textStyle12W400DarkGrey),
            ],
          ),
        ],
      ),
    );
  }
}
