import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class MedicationManagementSummary extends StatelessWidget {
  const MedicationManagementSummary({
    super.key,
    required this.currentCount,
    required this.interactionsCount,
    required this.adherencePercentage,
    required this.nextDoseText,
  });

  final int currentCount;
  final int interactionsCount;
  final int adherencePercentage;
  final String nextDoseText;

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: [
        SummaryBoxItem.icon(
          title: 'Current',
          value: '$currentCount',
          icon: Icons.medication,
          iconColor: AppColors.iconBlue,
          backgroundColor: AppColors.iconBGBlue,
        ),
        SummaryBoxItem.icon(
          title: 'Interactions',
          value: '$interactionsCount',
          icon: Icons.warning_amber_rounded,
          iconColor: AppColors.iconRed,
          backgroundColor: AppColors.iconBGRed,
        ),
        SummaryBoxItem.icon(
          title: 'Adherence',
          value: '$adherencePercentage%',
          icon: Icons.compare_arrows,
          iconColor: AppColors.iconGreen,
          backgroundColor: AppColors.iconBGGreen,
        ),
        SummaryBoxItem.icon(
          title: 'Next Dose',
          value: nextDoseText,
          icon: Icons.schedule,
          iconColor: AppColors.iconBlue,
          backgroundColor: AppColors.iconBGBlue,
        ),
      ],
    );
  }
}

