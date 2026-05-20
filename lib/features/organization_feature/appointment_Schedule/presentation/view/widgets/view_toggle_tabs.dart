import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
enum ScheduleView { day, week, month }

/// Day / Week / Month toggle tabs
class ViewToggleTabs extends StatelessWidget {
  final ScheduleView selectedView;
  final ValueChanged<ScheduleView> onViewChanged;

  const ViewToggleTabs({
    super.key,
    required this.selectedView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 38.h,
        padding: EdgeInsets.all(3.r),
        decoration: BoxDecoration(
          color: AppColors.greyBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            _TabItem(
              label: 'Day',
              isSelected: selectedView == ScheduleView.day,
              onTap: () => onViewChanged(ScheduleView.day),
            ),
            _TabItem(
              label: 'Week',
              isSelected: selectedView == ScheduleView.week,
              onTap: () => onViewChanged(ScheduleView.week),
            ),
            _TabItem(
              label: 'Month',
              isSelected: selectedView == ScheduleView.month,
              onTap: () => onViewChanged(ScheduleView.month),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    )
                  ]
                : null,
          ),
          child: Text(
            label,
            style: isSelected
                ? AppStyles.textStyle12W600Black
                : AppStyles.textStyle12W400DarkGrey,
          ),
        ),
      ),
    );
  }
}
