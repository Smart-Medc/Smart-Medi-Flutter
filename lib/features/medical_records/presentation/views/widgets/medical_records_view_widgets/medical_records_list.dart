import 'package:flutter/material.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_view_widgets/medical_records_document.dart';

class MedicalRecordsList extends StatelessWidget {
  const MedicalRecordsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return const MedicalRecordsDocument(
          documentName: 'Chest X-Ray',
          date: 'Mar 10, 2024',
          size: 8.1,
        );
      }, childCount: 5),
    );
  }
}
