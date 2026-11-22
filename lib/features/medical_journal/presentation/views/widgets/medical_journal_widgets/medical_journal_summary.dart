import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class MedicalJournalSummary extends StatelessWidget {
  const MedicalJournalSummary({
    super.key,
    required this.totalEntries,
    required this.avgMood,
    required this.thisMonth,
    required this.avgPain,
  });

  final int totalEntries;
  final double avgMood;
  final int thisMonth;
  final double avgPain;

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: [
        SummaryBoxItem.icon(
          title: 'Total Entries',
          value: '$totalEntries',
          icon: Icons.event_note,
          iconColor: AppColors.iconCyan,
          backgroundColor: AppColors.iconBGCyan,
        ),
        SummaryBoxItem.icon(
          title: 'Avg. Mood',
          value: avgMood.toStringAsFixed(1),
          icon: Icons.emoji_emotions,
          iconColor: AppColors.iconGreen,
          backgroundColor: AppColors.iconBGGreen,
        ),
        SummaryBoxItem.icon(
          title: 'This Month',
          value: '$thisMonth',
          icon: Icons.calendar_month,
          iconColor: AppColors.iconCyan,
          backgroundColor: AppColors.iconBGCyan,
        ),
        SummaryBoxItem.icon(
          title: 'Avg. Pain',
          value: avgPain.toStringAsFixed(1),
          icon: Icons.monitor_heart_outlined,
          iconColor: AppColors.iconBlue,
          backgroundColor: AppColors.iconBGBlue,
        ),
      ],
    );
  }
}

