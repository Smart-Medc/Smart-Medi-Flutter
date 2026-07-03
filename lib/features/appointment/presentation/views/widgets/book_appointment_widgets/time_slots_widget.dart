import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_hours_models/get_availability_hours_response.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class TimeSlotsWidget extends StatelessWidget {
  final DateTime selectedDate;
  final String? selectedTime;
  final List<GetAvailabilityHoursResponse> availabilityHours;
  final ValueChanged<String> onTimeSelected;

  const TimeSlotsWidget({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.availabilityHours,
    required this.onTimeSelected,
  });

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
    final hasAvailableHours = availabilityHours.any(
          (e) => e.status == AvailabilityStatus.available,
    );

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
          // Header
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

          Text(
            _formatDate(selectedDate),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textBlack,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 14),

          // EMPTY STATE
          if (!hasAvailableHours)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.primaryLightColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primaryLightColor,
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.primaryColor,
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'No available time slots for this date',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: availabilityHours.length,
              itemBuilder: (context, index) {
                final slot = availabilityHours[index];
                final isAvailable =
                    slot.status == AvailabilityStatus.available;
                final isSelected =
                    selectedTime == slot.startTime && isAvailable;

                return _TimeSlotCell(
                  slot: slot,
                  isSelected: isSelected,
                  onTap: isAvailable
                      ? () => onTimeSelected(slot.startTime)
                      : null,
                );
              },
            ),
        ],
      ),
    );
  }
}

class _TimeSlotCell extends StatelessWidget {
  final GetAvailabilityHoursResponse slot;
  final bool isSelected;
  final VoidCallback? onTap;

  const _TimeSlotCell({
    required this.slot,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled =
        slot.status != AvailabilityStatus.available;

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
          slot.startTime,
          style: TextStyle(
            fontSize: 12,
            fontWeight:
            isSelected ? FontWeight.w700 : FontWeight.w500,
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