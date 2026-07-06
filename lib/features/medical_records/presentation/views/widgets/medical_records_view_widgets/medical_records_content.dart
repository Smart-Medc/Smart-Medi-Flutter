import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_models/get_medical_records_response.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_view_widgets/medical_records_list.dart';
class MedicalRecordsContent extends StatelessWidget {
  const MedicalRecordsContent({super.key, required this.medicalRecordsResponse, required this.patientId});
  final GetMedicalRecordsResponse medicalRecordsResponse;
  final String patientId;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(child: Text('Records',style: AppStyles.textStyle24W600Black,)),
      SliverToBoxAdapter(child: 14.verticalSpace),
      MedicalRecordsList(medicalRecords: medicalRecordsResponse.items, patientId: patientId,),
    ]);
  }
}
