import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/custom_tabs.dart';
import 'package:smart_medi/features/notifications/data/models/notification_factory.dart';
import 'package:smart_medi/features/notifications/presentation/views/widgets/notification_item.dart';

class NotificationsTabs extends StatelessWidget {
  const NotificationsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabs(
      tabTitles: const ['All', 'Appointments', 'Medications', 'AI Alerts'],
      tabContents:  [
        NotificationItem(notification: NotificationFactory.getSampleNotifications().first),
        SizedBox.shrink(),
        SizedBox.shrink(),
        SizedBox.shrink(),
      ],
      badgeCounts: const [800, 99, 98, 1],
      isScrollable: true,
    );
  }
}