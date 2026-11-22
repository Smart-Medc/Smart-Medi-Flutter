import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';

/// A widget that displays a metric with an icon, label, and value.
/// Used in journal details to show mood, pain level, etc.
class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWithBackground(icon: icon, backgroundColor: iconBgColor, iconColor: iconColor),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppStyles.textStyle10W400DarkGrey,
              ),
              4.verticalSpace,
              Text(
                value,
                style: AppStyles.textStyle15W600Black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

