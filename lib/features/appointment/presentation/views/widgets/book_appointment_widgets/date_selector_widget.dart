import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class DateSelectorWidget extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateSelectorWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  late DateTime _currentMonth;

  // أيام الأسبوع
  static const List<String> _weekDays = [
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
  ];

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(
      widget.selectedDate.year,
      widget.selectedDate.month,
    );
  }

  /// الانتقال للشهر السابق
  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  /// الانتقال للشهر التالي
  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  /// الحصول على اسم الشهر
  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  /// بناء شبكة أيام التقويم
  List<Widget> _buildCalendarDays() {
    final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final startWeekday = firstDayOfMonth.weekday % 7; // 0 = Sunday

    List<Widget> cells = [];

    // خلايا فارغة قبل بداية الشهر
    for (int i = 0; i < startWeekday; i++) {
      cells.add(const SizedBox());
    }

    // أيام الشهر
    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, day);
      final isSelected =
          widget.selectedDate.year == date.year &&
          widget.selectedDate.month == date.month &&
          widget.selectedDate.day == date.day;
      final isToday =
          DateTime.now().year == date.year &&
          DateTime.now().month == date.month &&
          DateTime.now().day == date.day;

      cells.add(_DayCell(
        day: day,
        isSelected: isSelected,
        isToday: isToday && !isSelected,
        onTap: () => widget.onDateSelected(date),
      ));
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان القسم
          const Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: AppColors.primaryColor,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Select New Date',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // رأس التقويم - الشهر والسنة مع أزرار التنقل
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: _previousMonth,
                child: const Icon(
                  Icons.chevron_left,
                  color: AppColors.textDarkGrey,
                  size: 24,
                ),
              ),
              Text(
                '${_getMonthName(_currentMonth.month)} ${_currentMonth.year}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlack,
                ),
              ),
              GestureDetector(
                onTap: _nextMonth,
                child: const Icon(
                  Icons.chevron_right,
                  color: AppColors.textDarkGrey,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // أيام الأسبوع
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _weekDays
                .map(
                  (day) => SizedBox(
                    width: 36,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDarkGrey,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 8),

          // شبكة الأيام
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.0,
            mainAxisSpacing: 2,
            crossAxisSpacing: 0,
            children: _buildCalendarDays(),
          ),
        ],
      ),
    );
  }
}

/// خلية اليوم في التقويم
class _DayCell extends StatelessWidget {
  final int day;
  final bool isSelected;
  final bool isToday;
  final VoidCallback onTap;

  const _DayCell({
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '$day',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? AppColors.white
                : isToday
                    ? AppColors.primaryColor
                    : AppColors.textDarkGrey,
          ),
        ),
      ),
    );
  }
}
