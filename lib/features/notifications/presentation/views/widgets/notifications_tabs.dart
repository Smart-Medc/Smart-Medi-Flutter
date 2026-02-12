import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/custom_tabs.dart';
import 'package:smart_medi/features/notifications/data/models/notification_factory.dart';
import 'package:smart_medi/features/notifications/data/models/notification_model.dart';
import 'package:smart_medi/features/notifications/presentation/views/widgets/notifications_list.dart';

class NotificationsTabs extends StatelessWidget {
  const NotificationsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    // Get sample notifications (replace this with real data from state management)
    final allNotifications = NotificationFactory.getSampleNotifications();

    // Count unread notifications for each type
    final unreadAll = allNotifications.where((n) => !n.isRead).length;
    final unreadAppointments = allNotifications
        .where((n) => n.type == NotificationType.appointment && !n.isRead)
        .length;
    final unreadMedications = allNotifications
        .where((n) => n.type == NotificationType.medication && !n.isRead)
        .length;
    final unreadAIAlerts = allNotifications
        .where((n) => n.type == NotificationType.aiInsight && !n.isRead)
        .length;

    return CustomTabs(
      tabTitles: const ['All', 'Appointments', 'Medications', 'AI Alerts'],
      tabContents: [
        NotificationsList(
          notifications: allNotifications,
        ),
        NotificationsList(
          notifications: allNotifications,
          filterType: NotificationType.appointment,
        ),
        NotificationsList(
          notifications: allNotifications,
          filterType: NotificationType.medication,
        ),
        NotificationsList(
          notifications: allNotifications,
          filterType: NotificationType.aiInsight,
        ),
      ],
      badgeCounts: [
        unreadAll,
        unreadAppointments,
        unreadMedications,
        unreadAIAlerts,
      ],
      isScrollable: true,
    );
  }
}