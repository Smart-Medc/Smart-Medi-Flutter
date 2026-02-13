import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';
import 'package:smart_medi/core/widgets/status_badge.dart';
import 'package:smart_medi/features/notifications/data/models/notification_model.dart';

class NotificationItem extends StatelessWidget {

  const NotificationItem({
    super.key,
    required this.notification,
    this.onTap,
    this.onMarkAsRead,
  });
  final NotificationModel notification;
  final VoidCallback? onTap;
  final VoidCallback? onMarkAsRead;

  // Get icon based on notification type
  IconData _getIcon() {
    switch (notification.type) {
      case NotificationType.appointment:
        return Icons.calendar_today_outlined;
      case NotificationType.medication:
        return Icons.medication_outlined;
      case NotificationType.aiInsight:
        return Icons.lightbulb_outline;
    }
  }

  // Get icon color based on notification type
  Color _getIconColor() {
    switch (notification.type) {
      case NotificationType.appointment:
        return AppColors.iconBlue;
      case NotificationType.medication:
        return AppColors.iconCyan;
      case NotificationType.aiInsight:
        return AppColors.iconYellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      backgroundColor: notification.isRead ? Colors.white : AppColors.iconBGBlue,
      borderColor: notification.isRead ? AppColors.formFieldStrokeColor : AppColors.iconBlue,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconWithBackground(icon: _getIcon(), backgroundColor: AppColors.iconBGCyan, iconColor: _getIconColor()),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: AppStyles.textStyle12W600Black,
                      ),
                      5.verticalSpace,
                      Text(
                        notification.message,
                        style: AppStyles.textStyle10W400LightGrey,
                      ),
                      30.verticalSpace,
                      Text(notification.getTimeAgo(), style: AppStyles.textStyle10W400LightGrey),
                    ],
                  ),
                ),
                if (!notification.isRead)
                  SizedBox(
                    width: 90.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const StatusBadge(
                          text: 'New',
                          backgroundColor: AppColors.primaryColor,
                        ),
                        60.verticalSpace,
                        GestureDetector(
                          onTap: onMarkAsRead,
                          child: Text('Mark As Read', style: AppStyles.textStyle12W500Black),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

