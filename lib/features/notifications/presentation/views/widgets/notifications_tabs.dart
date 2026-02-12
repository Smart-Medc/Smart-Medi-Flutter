import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/custom_tabs.dart';

class NotificationsTabs extends StatelessWidget {
  const NotificationsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabs(
      tabTitles: const ['All', 'Appointments', 'Medications', 'AI Alerts'],
      tabContents: const [
        SizedBox.shrink(),
        SizedBox.shrink(),
        SizedBox.shrink(),
        SizedBox.shrink(),
      ],
      badgeCounts: const [800, 99, 98, 1],
      isScrollable: true,
    );
  }
}