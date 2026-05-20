import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/data/model/appointment_schedule_model.dart'
   ;
import 'status_badge.dart';

/// Slim appointment row used inside the week view day card
class WeekAppointmentRow extends StatelessWidget {
  final AppointmentScheduleModel appointment;

  const WeekAppointmentRow({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.whiteBackgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          // Time
          Text(
            appointment.time,
            style: AppStyles.textStyle12W600Black,
          ),
          SizedBox(width: 10.w),
          // Patient name
          Expanded(
            child: Text(
              'patientName',
              style: AppStyles.textStyle12W400DarkGrey,
            ),
          ),
          // Status badge
          StatusBadge(status: AppointmentStatus.completed),
        ],
      ),
    );
  }
}

/// Card containing a full day's appointments in Week view
class WeekDayCard extends StatelessWidget {
  final String dayName;
  final List<AppointmentScheduleModel> appointments;

  const WeekDayCard({
    super.key,
    required this.dayName,
    required this.appointments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.formFieldStrokeColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day name header
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              dayName,
              style: AppStyles.textStyle14W400Black.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Appointments
          ...appointments
              .map((appt) => WeekAppointmentRow(appointment: appt))
              .toList(),
        ],
      ),
    );
  }
}

/// Full week view scroll list
class WeekViewList extends StatelessWidget {
  final Map<String, List<AppointmentScheduleModel>> weekData;

  const WeekViewList({super.key, required this.weekData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: weekData.entries
            .map(
              (entry) => WeekDayCard(
                dayName: entry.key,
                appointments: entry.value,
              ),
            )
            .toList(),
      ),
    );
  }
}
