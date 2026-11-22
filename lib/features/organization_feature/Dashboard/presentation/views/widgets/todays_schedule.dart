import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'schedule_item.dart';


class TodaysSchedule extends StatelessWidget {
  const TodaysSchedule({super.key});

  final List<Map<String, String>> appointments = const [
    {
      'time': '09:00 AM',
      'patientName': 'John Smith',
      'appointmentType': 'Checkup',
      'status': 'Completed',
    },
    {
      'time': '10:30 AM',
      'patientName': 'Emily Davis',
      'appointmentType': 'Follow-up',
      'status': 'Completed',
    },
    {
      'time': '11:00 AM',
      'patientName': 'Michael Brown',
      'appointmentType': 'Consultation',
      'status': 'In Progress',
    },
    {
      'time': '02:00 PM',
      'patientName': 'Sarah Wilson',
      'appointmentType': 'Annual Physical',
      'status': 'Upcoming',
    },
    {
      'time': '02:00 PM',
      'patientName': 'David Johnson',
      'appointmentType': 'Lab Review',
      'status': 'Upcoming',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Schedule",
                  style: AppStyles.textStyle15W600Black,
                ),
                Text(
                  'March 22, 2024',
                  style: AppStyles.textStyle12W400DarkGrey.copyWith(
                    color: AppColors.textBlue,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.greyBackgroundColor,
            height: 1,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return ScheduleItem(
                time: appointment['time']!,
                patientName: appointment['patientName']!,
                appointmentType: appointment['appointmentType']!,
                status: appointment['status']!,
              );
            },
          ),
        ],
      ),
    );
  }
}
