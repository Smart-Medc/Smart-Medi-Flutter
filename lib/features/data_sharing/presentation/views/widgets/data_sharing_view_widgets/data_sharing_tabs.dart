import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/sliver_custom_tab_view.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/shared_records_list.dart';

class DataSharingTabs extends StatelessWidget {
  const DataSharingTabs({super.key, required this.getSharedRecordsResponse});
  final GetSharedRecordsResponse getSharedRecordsResponse;
  @override
  Widget build(BuildContext context) {
    return SliverCustomTabView(
      tabTitles: const ['Active Shares', 'Expired/Revoked'],
      tabContents: [
        SharedRecordsList(sharedRecords: getSharedRecordsResponse.activeShares),
        SharedRecordsList(sharedRecords: getSharedRecordsResponse.expiredOrRevokedShares),
      ],
      badgeCounts: [getSharedRecordsResponse.activeShares.length, getSharedRecordsResponse.expiredOrRevokedShares.length],
    );
  }
}
