import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_models/get_medical_records_response.dart';

class MedicalRecordsSummary extends StatelessWidget {
  const MedicalRecordsSummary({
    super.key,
    required this.medicalRecordsResponse,
  });

  final GetMedicalRecordsResponse medicalRecordsResponse;

  @override
  Widget build(BuildContext context) {
    final items = medicalRecordsResponse.items;

    final totalRecords = items.length;

    final labReports =
        items.where((e) => e.recordType == 'LabReport').length;

    final imaging =
        items.where((e) => e.recordType == 'Imaging').length;

    final totalSizeBytes =
    items.fold<int>(0, (sum, e) => sum + e.totalDocumentSize);

    final storageUsedGB = totalSizeBytes / (1024 * 1024 * 1024);

    return SummaryBox(
      items: [
        SummaryBoxItem.line(
          title: 'Total Records',
          value: '$totalRecords',
        ),
        SummaryBoxItem.line(
          title: 'Lab Reports',
          value: '$labReports',
        ),
        SummaryBoxItem.line(
          title: 'Imaging',
          value: '$imaging',
        ),
        SummaryBoxItem.line(
          title: 'Storage Used',
          value: '${storageUsedGB.toStringAsFixed(2)} GB',
        ),
      ],
    );
  }
}