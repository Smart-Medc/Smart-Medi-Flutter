import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_record_details_models/get_medical_record_details_response.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/record_details_widgets/record_details_box.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/record_details_widgets/record_info_box.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/record_details_widgets/record_test_results_box.dart';
class RecordDetailsContent extends StatelessWidget {
  const RecordDetailsContent({super.key, required this.medicalRecordDetails});
  final GetMedicalRecordDetailsResponse medicalRecordDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecordInfoBox(medicalRecordDetails: medicalRecordDetails),
        16.verticalSpace,
         RecordDetailsBox(medicalRecordDetails: medicalRecordDetails,),
        16.verticalSpace,
        const RecordTestResultsBox(),
      ],
    );
  }
}
