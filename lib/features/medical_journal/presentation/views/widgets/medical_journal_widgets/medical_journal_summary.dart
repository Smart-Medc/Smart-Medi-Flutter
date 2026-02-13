import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class MedicalJournalSummary extends StatelessWidget {
  const MedicalJournalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: const [
        SummaryBoxItem.icon(
          title: 'Total Entries',
          value: '24',
          icon: Icons.event_note,
          iconColor: AppColors.iconCyan,
          backgroundColor: AppColors.iconBGCyan,
        ),
        SummaryBoxItem.icon(
          title: 'Avg. Mood',
          value: '7.2',
          icon: Icons.emoji_emotions,
          iconColor: AppColors.iconGreen,
          backgroundColor: AppColors.iconBGGreen,
        ),
        SummaryBoxItem.icon(
          title: 'This Month',
          value: '8',
          icon: Icons.calendar_month,
          iconColor: AppColors.iconCyan,
          backgroundColor: AppColors.iconBGCyan,
        ),
        SummaryBoxItem.icon(
          title: 'Avg. Pain',
          value: '4.5',
          icon: Icons.monitor_heart_outlined,
          iconColor: AppColors.iconBlue,
          backgroundColor: AppColors.iconBGBlue,
        ),
      ],
    );
  }
}

