import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/data/model/appointment_schedule_model.dart';
import 'day_appointment_card.dart';

/// Full scrollable day view with hour slots and appointment cards
class DayViewTimeline extends StatelessWidget {
  final List<AppointmentScheduleModel> appointments;

  const DayViewTimeline({super.key, required this.appointments});

  static const List<String> _hours = [
    '08:00', '09:00', '10:00', '11:00', '12:00',
    '13:00', '14:00', '15:00', '16:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.formFieldStrokeColor.withOpacity(0.3)),
      ),
      child: ListView.builder(
        itemCount: _hours.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final hour = _hours[index];
          final slotAppointments = appointments
              .where((a) => a.time.startsWith(hour.substring(0, 2)))
              .toList();

          return _TimeSlotRow(
            hour: hour,
            appointments: slotAppointments,
          );
        },
      ),
    );
  }
}

class _TimeSlotRow extends StatelessWidget {
  final String hour;
  final List<AppointmentScheduleModel> appointments;

  const _TimeSlotRow({required this.hour, required this.appointments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hour label
          SizedBox(
            width: 40.w,
            child: Text(
              hour,
              style: AppStyles.textStyle10W400DarkGrey,
            ),
          ),
          SizedBox(width: 8.w),
          // Content area
          Expanded(
            child: appointments.isEmpty
                ? _AvailableSlot()
                : Column(
                    children: appointments
                        .map((appt) => DayAppointmentCard(appointment: appt))
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}

class _AvailableSlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Text(
        'Available',
        style: AppStyles.textStyle10W400LightGrey,
      ),
    );
  }
}
