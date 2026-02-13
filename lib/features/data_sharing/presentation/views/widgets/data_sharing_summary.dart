import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class DataSharingSummary extends StatelessWidget {
  const DataSharingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: const [
        SummaryBoxItem.line(
          title: 'Active Shares',
          value: '2',
        ),
        SummaryBoxItem.line(
          title: 'Exired',
          value: '1',
        ),
        SummaryBoxItem.line(
          title: 'Total Accesses',
          value: '12',
        ),
        SummaryBoxItem.line(
          title: 'Revoked',
          value: '0',
        ),
      ],
    );
  }
}
