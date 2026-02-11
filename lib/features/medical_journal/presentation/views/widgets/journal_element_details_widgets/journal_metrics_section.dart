import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/journal_element_details_widgets/metric_card.dart';

/// Widget that displays mood and pain level metrics side by side
class JournalMetricsSection extends StatelessWidget {
  const JournalMetricsSection({
    super.key,
    required this.mood,
    required this.pain,
  });

  final String mood;
  final String pain;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.only(left: 40.w, top: 19.h, bottom: 16.h),
      child: Row(
        children: [
          Expanded(
            child: MetricCard(
              icon: Icons.mood,
              iconColor: AppColors.iconGreen,
              iconBgColor: AppColors.iconBGGreen,
              label: 'Mood',
              value: mood,
            ),
          ),
          24.horizontalSpace,
          Expanded(
            child: MetricCard(
              icon: Icons.monitor_heart_outlined,
              iconColor: AppColors.iconBlue,
              iconBgColor: AppColors.iconBGBlue,
              label: 'Pain level',
              value: pain,
            ),
          ),
        ],
      ),
    );
  }
}

