import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/data/model/appointment_schedule_model.dart';


/// Colored pill badge for appointment status
class StatusBadge extends StatelessWidget {
  final AppointmentStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _badgeConfig(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: config.textColor,
        ),
      ),
    );
  }

  _BadgeConfig _badgeConfig(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.confirmed:
        return _BadgeConfig(
          label: 'Confirmed',
          backgroundColor: AppColors.iconGreen,
          textColor: AppColors.textWhite,
        );
      case AppointmentStatus.inProgress:
        return _BadgeConfig(
          label: 'In-progress',
          backgroundColor: AppColors.iconCyan,
          textColor: AppColors.textWhite,
        );
      case AppointmentStatus.completed:
        return _BadgeConfig(
          label: 'Completed',
          backgroundColor: AppColors.iconBlue,
          textColor: AppColors.textWhite,
        );
      case AppointmentStatus.cancelled:
        return _BadgeConfig(
          label: 'Cancelled',
          backgroundColor: AppColors.iconRed,
          textColor: AppColors.textWhite,
        );
    }
  }
}

class _BadgeConfig {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  const _BadgeConfig({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
}
