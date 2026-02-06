import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/summary_item.dart';

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
        CardContainer(
          padding: EdgeInsets.only(left: 28.w, right: 60.w, top: 22.h, bottom: 22.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryItem.line(
                    title: 'Total Records',
                    value: '47',
                  ),
                  20.verticalSpace,
                  SummaryItem.line(
                    title: 'Lab Reports',
                    value: '18',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryItem.line(
                    title: 'Imaging',
                    value: '12',
                  ),
                  20.verticalSpace,
                  SummaryItem.line(
                    title: 'Storage Used',
                    value: '2.4 GB',
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
