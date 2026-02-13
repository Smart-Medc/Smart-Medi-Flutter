import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/custom_tabs.dart';
class DataSharingTabs extends StatelessWidget {
  const DataSharingTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabs(tabTitles: ['Active Shares','Expired/Revoked'], tabContents: [SizedBox.shrink(),SizedBox.shrink()],badgeCounts: [2,0],);
  }
}
