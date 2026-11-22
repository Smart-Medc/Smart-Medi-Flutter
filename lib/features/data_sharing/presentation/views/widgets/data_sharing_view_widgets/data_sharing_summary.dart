import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';

class DataSharingSummary extends StatelessWidget {
  const DataSharingSummary({super.key, required this.getSharedRecordsResponse});
  final GetSharedRecordsResponse getSharedRecordsResponse;
  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: [
        SummaryBoxItem.line(
          title: 'Active Shares',
          value: '${getSharedRecordsResponse.activeCount}',
        ),
        SummaryBoxItem.line(
          title: 'Expired',
          value: '${getSharedRecordsResponse.expiredCount}',
        ),
        SummaryBoxItem.line(
          title: 'Total Accesses',
          value: '${getSharedRecordsResponse.totalAccesses}',
        ),
        SummaryBoxItem.line(
          title: 'Revoked',
          value: '${getSharedRecordsResponse.revokedCount}',
        ),
      ],
    );
  }
}
