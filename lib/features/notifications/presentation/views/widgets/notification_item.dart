import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/notifications/data/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;
  final VoidCallback? onMarkAsRead;

  const NotificationItem({
    super.key,
    required this.notification,
    this.onTap,
    this.onMarkAsRead,
  });

  // Get icon based on notification type
  IconData _getIcon() {
    switch (notification.type) {
      case NotificationType.appointment:
        return Icons.calendar_today_outlined;
      case NotificationType.medication:
        return Icons.medication_outlined;
      case NotificationType.aiInsight:
        return Icons.lightbulb_outline;
      case NotificationType.medicalRecord:
        return Icons.description_outlined;
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
      case NotificationType.medicalRecord:
        return AppColors.iconBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : AppColors.iconBGBlue,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: notification.isRead ? const Color(0xFFE0E0E0) : AppColors.primaryColor,
          width: notification.isRead ? 1 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff696969).withValues(alpha: 0.08),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.iconBGBlue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(_getIcon(), color: _getIconColor(), size: 24.sp),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          notification.title,
                          style: AppStyles.textStyle15W600Black,
                        ),
                      ),
                      if (!notification.isRead)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text('New', style: AppStyles.textStyle10W400White),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 56.w),
              child: Text(
                notification.message,
                style: AppStyles.textStyle12W400DarkGrey,
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 56.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(notification.getTimeAgo(), style: AppStyles.textStyle12W400DarkGrey),
                  if (!notification.isRead && onMarkAsRead != null)
                    GestureDetector(
                      onTap: onMarkAsRead,
                      child: Text('Mark As Read', style: AppStyles.textStyle12W600Black),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

