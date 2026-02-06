import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/summary_item.dart';

class MedicalJournalSummary extends StatelessWidget {
  const MedicalJournalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Summary', style: AppStyles.textStyle24W700Black),
        12.verticalSpace,
        CardContainer(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryItem.icon(
                    title: 'Total Entries',
                    value: '24',
                    icon: Icons.event_note,
                    iconColor: AppColors.iconCyan,
                    backgroundColor: AppColors.iconBGCyan,
                  ),
                  12.verticalSpace,
                  SummaryItem.icon(
                    title: 'Avg. Mood',
                    value: '7.2',
                    icon: Icons.emoji_emotions,
                    iconColor: AppColors.iconGreen,
                    backgroundColor: AppColors.iconBGGreen,
                  ),
                ],
              ),
              80.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryItem.icon(
                    title: 'This Month',
                    value: '8',
                    icon: Icons.calendar_month,
                    iconColor: AppColors.iconCyan,
                    backgroundColor: AppColors.iconBGCyan,
                  ),
                  20.verticalSpace,
                  SummaryItem.icon(
                    title: 'Avg. Pain',
                    value: '4.5',
                    icon: Icons.monitor_heart_outlined,
                    iconColor: AppColors.iconBlue,
                    backgroundColor: AppColors.iconBGBlue,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

