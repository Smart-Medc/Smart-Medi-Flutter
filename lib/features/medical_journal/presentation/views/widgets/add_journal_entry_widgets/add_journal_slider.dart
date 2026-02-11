import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// A custom slider widget for journal entry forms
/// Displays label, value, icon, and slider in a structured layout
class AddJournalSlider extends StatelessWidget {
  const AddJournalSlider({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    required this.activeColor,
    required this.icon,
    required this.iconColor,
  });

  final double value;
  final String label;
  final ValueChanged<double> onChanged;
  final Color activeColor;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Label on left, value on right
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppStyles.textStyle14W400Black),
            Text(
              '${value.toInt()}/10',
              style: AppStyles.textStyle15W600Black,
            ),
          ],
        ),
        8.verticalSpace,
        // Icon and slider in a row
        Row(
          children: [
            Icon(icon, color: iconColor, size: 20.sp),
            8.horizontalSpace,
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: activeColor,
                  inactiveTrackColor: AppColors.formFieldStrokeColor,
                  thumbColor: activeColor,
                  overlayColor: activeColor.withValues(alpha: 0.2),
                  trackHeight: 4.h,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                ),
                child: Slider(
                  value: value,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

