import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';


class ScheduleItem extends StatelessWidget {
  final String time;
  final String patientName;
  final String appointmentType;
  final String status;

  const ScheduleItem({
    super.key,
    required this.time,
    required this.patientName,
    required this.appointmentType,
    required this.status,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.iconGreen;
      case 'in progress':
        return AppColors.iconBlue;
      case 'upcoming':
        return AppColors.iconYellow;
      default:
        return AppColors.textDarkGrey;
    }
  }

  Color _getStatusBackgroundColor() {
    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.iconBGGreen;
      case 'in progress':
        return AppColors.iconBGBlue;
      case 'upcoming':
        return AppColors.iconBGYellow;
      default:
        return AppColors.greyBackgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyBackgroundColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            child: Text(
              time,
              style: AppStyles.textStyle10W400DarkGrey,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  patientName,
                  style: AppStyles.textStyle12W600Black,
                ),
                SizedBox(height: 2.h),
                Text(
                  appointmentType,
                  style: AppStyles.textStyle10W400LightGrey,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: _getStatusBackgroundColor(),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              status,
              style: AppStyles.textStyle10W400TextBlue.copyWith(
                color: _getStatusColor(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
