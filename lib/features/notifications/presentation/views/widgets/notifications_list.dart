import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/notifications/data/models/notification_model.dart';
import 'package:smart_medi/features/notifications/presentation/views/widgets/notification_item.dart';

class NotificationsList extends StatefulWidget {
  final List<NotificationModel> notifications;
  final NotificationType? filterType; // null means show all

  const NotificationsList({
    super.key,
    required this.notifications,
    this.filterType,
  });

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  late List<NotificationModel> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = widget.notifications;
  }

  // Filter notifications based on type
  List<NotificationModel> get _filteredNotifications {
    if (widget.filterType == null) {
      return _notifications; // Show all
    }
    return _notifications.where((n) => n.type == widget.filterType).toList();
  }

  // Mark notification as read
  void _markAsRead(String id) {
    setState(() {
      final index = _notifications.indexWhere((n) => n.id == id);
      if (index != -1) {
        _notifications[index] = _notifications[index].copyWith(isRead: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredNotifications;

    if (filteredList.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: Text(
            'No notifications',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final notification = filteredList[index];
          return NotificationItem(
            notification: notification,
            onTap: () {
              print('Tapped notification: ${notification.title}');
            },
            onMarkAsRead: () => _markAsRead(notification.id),
          );
        },
      ),
    );
  }
}

