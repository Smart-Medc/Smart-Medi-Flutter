import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AppointmentInfoCard extends StatelessWidget {
  const AppointmentInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Appointment Information", style: AppStyles.textStyle15W600Black),
        const SizedBox(height: 12),
        Row(children: [
          const Icon(Icons.calendar_month, color: AppColors.primaryColor, size: 20),
          const SizedBox(width: 8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("DATE", style: AppStyles.textStyle10W400DarkGrey),
            Text("March 25, 2024", style: AppStyles.textStyle12W500Black),
          ]),
          const SizedBox(width: 40),
          const Icon(Icons.access_time, color: AppColors.primaryColor, size: 20),
          const SizedBox(width: 8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Time", style: AppStyles.textStyle10W400DarkGrey),
            Text("10:00 AM", style: AppStyles.textStyle12W500Black),
          ]),
        ]),
        const SizedBox(height: 16),
        Text("Reason for Visit", style: AppStyles.textStyle10W400DarkGrey),
        Text("Annual Physical Examination", style: AppStyles.textStyle14W400Black),
        const SizedBox(height: 12),
        Text("Special Requirements", style: AppStyles.textStyle10W400DarkGrey),
        Text("Please have recent blood test results available for review", style: AppStyles.textStyle12W500Black),
      ]),
    );
  }
}