import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// Dot indicator shown on calendar day cells
class _CalendarDot extends StatelessWidget {
  final Color color;
  const _CalendarDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5.w,
      height: 5.h,
      margin: EdgeInsets.only(right: 2.w),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

/// Single day cell in the month grid
class MonthDayCell extends StatelessWidget {
  final int? day;
  final bool isCurrentMonth;
  final List<Color> dotColors;

  const MonthDayCell({
    super.key,
    required this.day,
    this.isCurrentMonth = true,
    this.dotColors = const [],
  });

  @override
  Widget build(BuildContext context) {
    if (day == null) return const SizedBox();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$day',
          style: isCurrentMonth
              ? AppStyles.textStyle11W500Black
              : AppStyles.textStyle11W500Black.copyWith(
                  color: AppColors.textLightGrey),
        ),
        if (dotColors.isNotEmpty) ...[
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dotColors
                .map((c) => _CalendarDot(color: c))
                .toList(),
          ),
        ],
      ],
    );
  }
}

/// Full month calendar grid widget
class MonthCalendarGrid extends StatelessWidget {
  const MonthCalendarGrid({super.key});

  static const List<String> _weekDays = [
    'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'
  ];

  // January 2026 starts on Thursday (index 4)
  // 31 days total
  static final List<_DayCellData> _days = _buildJanuary2026();

  static List<_DayCellData> _buildJanuary2026() {
    final cells = <_DayCellData>[];

    // Leading empty cells (Sun=0, Mon=1, Tue=2, Wed=3, Thu=4 → 4 blanks)
    for (int i = 0; i < 4; i++) {
      cells.add(_DayCellData(day: null));
    }

    // Days 1–31 with some dot indicators
    for (int d = 1; d <= 31; d++) {
      cells.add(_DayCellData(day: d, dotColors: _dotsForDay(d)));
    }

    // Trailing cells to fill grid (next month)
    final trailing = (7 - (cells.length % 7)) % 7;
    for (int i = 1; i <= trailing; i++) {
      cells.add(_DayCellData(day: i, isCurrentMonth: false));
    }

    return cells;
  }

  static List<Color> _dotsForDay(int day) {
    // Match screenshot dot patterns
    const Map<int, List<Color>> dots = {
      7: [AppColors.iconBlue],
      10: [AppColors.iconGreen],
      13: [AppColors.iconBlue],
      16: [AppColors.iconGreen],
      18: [AppColors.iconBlue],
      22: [AppColors.iconGreen],
      26: [AppColors.iconGreen, AppColors.iconBlue],
      28: [AppColors.iconBlue],
      30: [AppColors.iconGreen],
      4: [AppColors.iconGreen, AppColors.iconBlue],  // trailing
    };
    return dots[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.formFieldStrokeColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          // Weekday headers
          Row(
            children: _weekDays
                .map(
                  (d) => Expanded(
                    child: Center(
                      child: Text(d, style: AppStyles.textStyle10W500DarkGrey),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 8.h),
          // Day grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 0,
              childAspectRatio: 1.0,
            ),
            itemCount: _days.length,
            itemBuilder: (context, index) {
              final data = _days[index];
              return MonthDayCell(
                day: data.day,
                isCurrentMonth: data.isCurrentMonth,
                dotColors: data.dotColors,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DayCellData {
  final int? day;
  final bool isCurrentMonth;
  final List<Color> dotColors;

  _DayCellData({
    this.day,
    this.isCurrentMonth = true,
    this.dotColors = const [],
  });
}

/// Status legend card shown below the month calendar
class StatusLegendCard extends StatelessWidget {
  const StatusLegendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.formFieldStrokeColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Status Legend', style: AppStyles.textStyle12W600Black),
          SizedBox(height: 10.h),
          Row(
            children: const [
              _LegendItem(color: AppColors.iconGreen, label: 'Completed'),
              _LegendItem(color: AppColors.iconCyan, label: 'In-progress'),
              _LegendItem(color: AppColors.iconBlue, label: 'Completed'),
              _LegendItem(color: AppColors.iconRed, label: 'Cancelled'),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 4.w),
          Flexible(
            child: Text(
              label,
              style: AppStyles.textStyle10W400DarkGrey,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
