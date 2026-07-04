import 'package:flutter/material.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_models/get_medical_records_response.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_view_widgets/medical_records_document.dart';

class MedicalRecordsList extends StatelessWidget {
  const MedicalRecordsList({super.key, required this.medicalRecords});
  final List<MedicalRecordModel> medicalRecords;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return  MedicalRecordsDocument(
          documentName: medicalRecords[index].title,
          date: medicalRecords[index].formattedRecordDate,
          size: medicalRecords[index].totalDocumentSize.toDouble(),
        );
      }, childCount: medicalRecords.length),
    );
  }
}
