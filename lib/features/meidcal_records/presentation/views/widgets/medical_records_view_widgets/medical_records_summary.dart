import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class MedicalRecordsSummary extends StatelessWidget {
  const  MedicalRecordsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: const [
        SummaryBoxItem.line(
          title: 'Total Records',
          value: '47',
        ),
        SummaryBoxItem.line(
          title: 'Lab Reports',
          value: '18',
        ),
        SummaryBoxItem.line(
          title: 'Imaging',
          value: '12',
        ),
        SummaryBoxItem.line(
          title: 'Storage Used',
          value: '2.4 GB',
        ),
      ],
    );
  }
}
