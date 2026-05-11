import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

/// موديل الوقت المتاح
class TimeSlot {
  final String time;
  final bool isAvailable;

  const TimeSlot({required this.time, this.isAvailable = true});
}

/// ويدجت الأوقات المتاحة
/// تعرض: عنوان القسم + التاريخ المختار + شبكة الأوقات المتاحة وغير المتاحة
class TimeSlotsWidget extends StatelessWidget {
  final DateTime selectedDate;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;

  /// قائمة الأوقات المتاحة - بعضها غير متاح (isAvailable = false)
  static const List<TimeSlot> _timeSlots = [
    TimeSlot(time: '9:00 AM', isAvailable: true),
    TimeSlot(time: '9:30 AM', isAvailable: true),
    TimeSlot(time: '10:00 AM', isAvailable: true),
    TimeSlot(time: '10:30 AM', isAvailable: false),
    TimeSlot(time: '11:00 AM', isAvailable: true),
    TimeSlot(time: '11:30 AM', isAvailable: true),
    TimeSlot(time: '2:00 PM', isAvailable: true),
    TimeSlot(time: '2:30 PM', isAvailable: true),
    TimeSlot(time: '3:00 PM', isAvailable: true),
    TimeSlot(time: '3:30 PM', isAvailable: false),
    TimeSlot(time: '4:00 PM', isAvailable: true),
    TimeSlot(time: '4:30 PM', isAvailable: true),
  ];

  const TimeSlotsWidget({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  /// تنسيق اسم اليوم من التاريخ
  String _formatDate(DateTime date) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
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
    return '${days[date.weekday - 1]}, ${months[date.month - 1]} ${date.day}';
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
                Icons.access_time_outlined,
                color: AppColors.primaryColor,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Available Time Slots',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // التاريخ المختار
          Text(
            _formatDate(selectedDate),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textBlack,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 14),

          // شبكة الأوقات
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _timeSlots.length,
            itemBuilder: (context, index) {
              final slot = _timeSlots[index];
              final isSelected = selectedTime == slot.time && slot.isAvailable;

              return _TimeSlotCell(
                slot: slot,
                isSelected: isSelected,
                onTap: slot.isAvailable
                    ? () => onTimeSelected(slot.time)
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

/// خلية وقت واحد في شبكة الأوقات
class _TimeSlotCell extends StatelessWidget {
  final TimeSlot slot;
  final bool isSelected;
  final VoidCallback? onTap;

  const _TimeSlotCell({
    required this.slot,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = !slot.isAvailable;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryLightColor
              : isDisabled
                  ? AppColors.grey
                  : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : isDisabled
                    ? AppColors.textDarkGrey
                    : AppColors.iconBGRed,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          slot.time,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? AppColors.primaryColor
                : isDisabled
                    ? AppColors.textDarkGrey
                    : AppColors.textBlack,
          ),
        ),
      ),
    );
  }
}
