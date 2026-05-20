import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/data/model/appointment_schedule_model.dart';
import 'status_badge.dart';

/// Single appointment card used in Day view timeline
class DayAppointmentCard extends StatelessWidget {
  final AppointmentScheduleModel appointment;

  const DayAppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.w, bottom: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.iconBGBlue,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Time + duration + patient info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Clock icon + time + duration
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 12.sp,
                      color: AppColors.iconBlue,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${appointment.time} (${appointment.duration})',
                      style: AppStyles.textStyle10W400TextBlue,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                // Person icon + patient name + type
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColors.iconBGBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        size: 13.sp,
                        color: AppColors.iconBlue,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment.patientName,
                          style: AppStyles.textStyle12W600Black,
                        ),
                        Text(
                          appointment.appointmentType,
                          style: AppStyles.textStyle10W400DarkGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Status badge
          StatusBadge(status: AppointmentStatus.confirmed),
        ],
      ),
    );
  }
}
