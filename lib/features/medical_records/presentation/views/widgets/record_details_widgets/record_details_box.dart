import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_record_details_models/get_medical_record_details_response.dart';

class RecordDetailsBox extends StatelessWidget {
  const RecordDetailsBox({super.key, required this.medicalRecordDetails});
  final GetMedicalRecordDetailsResponse medicalRecordDetails;
  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Record Details',style: AppStyles.textStyle24W600Black,),
          20.verticalSpace,
          recordDetailsBoxItem(title: 'Record Date', value: medicalRecordDetails.formattedRecordDate),
          8.verticalSpace,
          recordDetailsBoxItem(title: 'Ordered By', value: medicalRecordDetails.orderedBy ?? 'N/A'),
          8.verticalSpace,
          recordDetailsBoxItem(title: 'Provider', value: medicalRecordDetails.providerName ?? 'N/A'),
          8.verticalSpace,
          recordDetailsBoxItem(title: 'Status', value: medicalRecordDetails.status),
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
            Text(title,style: AppStyles.textStyle12W400LightGrey,),
            const Spacer(),
            Text(value,style: AppStyles.textStyle11W500Black,),
            10.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
