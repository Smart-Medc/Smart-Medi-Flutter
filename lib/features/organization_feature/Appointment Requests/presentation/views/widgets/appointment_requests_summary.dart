import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class AppointmentRequestsSummary extends StatelessWidget {
  const AppointmentRequestsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      items: const [
        SummaryBoxItem.icon(
          title: 'Pending Review',
          value: '8',
          icon: Icons.access_time_outlined,
          iconColor: AppColors.iconCyan,
          backgroundColor: AppColors.iconBGCyan,
        ),
        SummaryBoxItem.icon(
          title: 'Accepted ',
          value: '142',
          icon: Icons.check_circle_outline_rounded,
          iconColor: AppColors.iconGreen,
          backgroundColor: AppColors.iconBGGreen,
        ),
        SummaryBoxItem.icon(
          title: 'Rejected',
          value: '12',
          icon: Icons.cancel_outlined,
          iconColor: AppColors.iconRed,
          backgroundColor: AppColors.iconBGRed,
        ),
        SummaryBoxItem.icon(
          title: '-',
          value: "--",
          icon: Icons.minimize,
          iconColor: AppColors.iconBlue,
          backgroundColor: AppColors.iconBGBlue,
        ),
      ],
    );
  }
}
