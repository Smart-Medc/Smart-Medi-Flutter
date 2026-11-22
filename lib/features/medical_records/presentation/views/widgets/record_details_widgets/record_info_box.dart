import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_record_details_models/get_medical_record_details_response.dart';

class RecordInfoBox extends StatelessWidget {
  const RecordInfoBox({super.key, required this.medicalRecordDetails});
  final GetMedicalRecordDetailsResponse medicalRecordDetails;
  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.only(left: 16.w, right: 40.w),
      borderColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Record Info',
              style: AppStyles.textStyle24W600Black,
            ),
            20.verticalSpace,
            Row(
              children: [
                20.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoItem(title: 'Type', value: medicalRecordDetails.recordType),
                    10.verticalSpace,
                    infoItem(title: 'Date', value: medicalRecordDetails.formattedRecordDate),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoItem(title: 'File Size', value: '${medicalRecordDetails.totalDocumentSize.toStringAsFixed(2)} MB'),
                    10.verticalSpace,
                    infoItem(title: 'Format', value: 'DICOM'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget infoItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle10W400LightGrey,
        ),
        4.verticalSpace,
        Text(
          value,
          style: AppStyles.textStyle15W600Black,
        ),
      ],
    );
  }
}
