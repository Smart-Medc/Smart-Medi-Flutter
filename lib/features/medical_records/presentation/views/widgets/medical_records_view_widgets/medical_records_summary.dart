import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_statistics/get_medical_records_statistics_response.dart';

class MedicalRecordsSummary extends StatelessWidget {
  const MedicalRecordsSummary({
    super.key,
    required this.statistics,
  });

  final GetMedicalRecordsStatisticsResponse statistics;

  @override
  Widget build(BuildContext context) {

    return SummaryBox(
      items: [
        SummaryBoxItem.line(
          title: 'Total Records',
          value: '${statistics.totalRecords}',
        ),
        SummaryBoxItem.line(
          title: 'Lab Reports',
          value: '${statistics.labReports}',
        ),
        SummaryBoxItem.line(
          title: 'Imaging',
          value: '${statistics.imaging}',
        ),
        SummaryBoxItem.line(
          title: 'Storage Used',
          value: statistics.formattedStorageUsed,
        ),
      ],
    );
  }
}