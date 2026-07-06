import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/sliver_custom_tab_view.dart';
import 'package:smart_medi/features/data_sharing/data/models/shared_record_factory.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/shared_records_list.dart';

class DataSharingTabs extends StatelessWidget {
  const DataSharingTabs({super.key});

  @override
  Widget build(BuildContext context) {
    // Get data from factory - in real app, this would come from a state management solution
    final activeShares = SharedRecordFactory.getActiveShares();
    final expiredShares = SharedRecordFactory.getExpiredShares();

    return SliverCustomTabView(
      tabTitles: const ['Active Shares', 'Expired/Revoked'],
      tabContents: [
        SharedRecordsList(sharedRecords: activeShares),
        SharedRecordsList(sharedRecords: expiredShares),
      ],
      badgeCounts: [activeShares.length, expiredShares.length],
    );
  }
}
