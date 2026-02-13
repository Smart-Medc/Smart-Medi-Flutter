import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';
import 'package:smart_medi/features/data_sharing/data/models/shared_record_factory.dart';

class DataSharingSummary extends StatelessWidget {
  const DataSharingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final allRecords = SharedRecordFactory.createSampleRecords();
    final activeCount = SharedRecordFactory.getActiveSharesCount();
    final expiredCount = SharedRecordFactory.getExpiredSharesCount();
    final totalAccesses = allRecords.fold<int>(0, (sum, record) => sum + record.accessedCount);
    final revokedCount = allRecords.where((r) => !r.isActive && r.accessedCount > 0).length;

    return SummaryBox(
      items: [
        SummaryBoxItem.line(
          title: 'Active Shares',
          value: '$activeCount',
        ),
        SummaryBoxItem.line(
          title: 'Expired',
          value: '$expiredCount',
        ),
        SummaryBoxItem.line(
          title: 'Total Accesses',
          value: '$totalAccesses',
        ),
        SummaryBoxItem.line(
          title: 'Revoked',
          value: '$revokedCount',
        ),
      ],
    );
  }
}
