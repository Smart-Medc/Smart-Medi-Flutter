import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class MedicationManagementSummary extends StatelessWidget {
  const MedicationManagementSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: const [
        SummaryBoxItem.icon(
          title: 'Current',
          value: '2',
          icon: Icons.medication,
          iconColor: AppColors.iconBlue,
          backgroundColor: AppColors.iconBGBlue,
        ),
        SummaryBoxItem.icon(
          title: 'Interactions',
          value: '1',
          icon: Icons.warning_amber_rounded,
          iconColor: AppColors.iconRed,
          backgroundColor: AppColors.iconBGRed,
        ),
        SummaryBoxItem.icon(
          title: 'Adherence',
          value: '92%',
          icon: Icons.compare_arrows,
          iconColor: AppColors.iconGreen,
          backgroundColor: AppColors.iconBGGreen,
        ),
        SummaryBoxItem.icon(
          title: 'Next Dose',
          value: '2:00 PM',
          icon: Icons.schedule,
          iconColor: AppColors.iconBlue,
          backgroundColor: AppColors.iconBGBlue,
        ),
      ],
    );
  }
}

