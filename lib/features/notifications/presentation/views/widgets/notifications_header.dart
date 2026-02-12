import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_header.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: AppHeader(
            title: 'Notifications',
            subtitle: 'Stay updated with your health activities ',
          ),
        ),
        60.horizontalSpace,
        Column(
          children: [
            _buildNotificationButton(text: 'Settings', icon: Icons.settings),
            8.verticalSpace,
            _buildNotificationButton(text: 'Mark all as read'),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationButton({
    required String text,
    VoidCallback? onPressed,
    IconData? icon,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 36.h,
        width: 135.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.formFieldStrokeColor, width: 0.5.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16.sp, color: AppColors.textBlack),
              5.horizontalSpace,
            ],
            Text(text, style: AppStyles.textStyle12W600Black),
          ],
        ),
      ),
    );
  }
}