import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class OrganizationSummary extends StatelessWidget {
  const OrganizationSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: const [
        SummaryBoxItem.icon(
          title: 'Appointments Today',
          value: '24',
          icon: Icons.calendar_today_outlined,
          iconColor: AppColors.iconCyan,
          backgroundColor: AppColors.iconBGCyan,
        ),
        SummaryBoxItem.icon(
          title: 'Total Patients',
          value: "1,247",
          icon: Icons.people_outline,
          iconColor: AppColors.iconGreen,
          backgroundColor: AppColors.iconBGGreen,
        ),
        SummaryBoxItem.icon(
          title: 'Pending Requests',
          value: '8',
          icon: Icons.access_time_outlined,
          iconColor: AppColors.iconCyan,
          backgroundColor: AppColors.iconBGCyan,
        ),
        SummaryBoxItem.icon(
          title: 'Satisfaction Rate',
          value: "98%",
          icon: Icons.sentiment_satisfied_outlined,
          iconColor: AppColors.iconBlue,
          backgroundColor: AppColors.iconBGBlue,
        ),
      ],
    );
  }
}
