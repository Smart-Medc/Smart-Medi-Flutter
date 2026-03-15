import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class MedicationTabs extends StatelessWidget {
  const MedicationTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.currentCount,
    required this.pastCount,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabChanged;
  final int currentCount;
  final int pastCount;

  static const List<String> _titles = [
    'Current Medication',
    'Past Medication',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.formFieldBGColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: List.generate(_titles.length, (index) {
          final isSelected = index == selectedIndex;
          final badgeCount = index == 0 ? currentCount : pastCount;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                margin: EdgeInsets.all(6.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.textWhite : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '${_titles[index]} (${badgeCount > 99 ? '+99' : badgeCount})',
                  style: isSelected
                      ? AppStyles.textStyle12W500Black
                      : AppStyles.textStyle12W500DarkGrey,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

