import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_reschedule_widgets/appointments_reschedule_header.dart';

class AppointmentsRescheduleView extends StatefulWidget {
  const AppointmentsRescheduleView({super.key});

  @override
  State<AppointmentsRescheduleView> createState() =>
      _AppointmentsRescheduleViewState();
}

class _AppointmentsRescheduleViewState
    extends State<AppointmentsRescheduleView> {
  DateTime _focusedMonth = DateTime(2025, 12);
  DateTime? _selectedDate = DateTime(2025, 12, 16);
  String? _selectedTime;

  // Available time slots — null means disabled
  final List<String?> _timeSlots = [
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    null, // disabled: 10:30 AM
    '11:00 AM',
    '11:30 AM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    null, // disabled: 3:30 PM
    '4:00 PM',
    '4:30 PM',
  ];

  final List<String> _allSlotLabels = [
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
  ];

  final List<bool> _slotEnabled = [
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
  ];

  void _previousMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
    });
  }

  String _monthLabel(DateTime dt) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[dt.month - 1]} ${dt.year}';
  }

  String _selectedDateLabel() {
    if (_selectedDate == null) return '';
    const days = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    // weekday: 1=Mon … 7=Sun
    final dayName = days[_selectedDate!.weekday - 1];
    return '$dayName, ${months[_selectedDate!.month - 1]} ${_selectedDate!.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppointmentsRescheduleHeader(),
              const SizedBox(height: 16),
              // Calendar card
              _Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.calendar_today_outlined,
                            color: Color(0xFF2563EB), size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Select New Date',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _CalendarWidget(
                      focusedMonth: _focusedMonth,
                      selectedDate: _selectedDate,
                      monthLabel: _monthLabel(_focusedMonth),
                      onPrevious: _previousMonth,
                      onNext: _nextMonth,
                      onDateSelected: (date) {
                        setState(() => _selectedDate = date);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Time slots card
              _Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.access_time_outlined,
                            color: Color(0xFF2563EB), size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Available Time Slots',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _selectedDateLabel(),
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _allSlotLabels.length,
                      itemBuilder: (context, i) {
                        final label = _allSlotLabels[i];
                        final enabled = _slotEnabled[i];
                        final selected = _selectedTime == label && enabled;
                        return _TimeSlotChip(
                          label: label,
                          enabled: enabled,
                          selected: selected,
                          onTap: enabled
                              ? () => setState(() => _selectedTime = label)
                              : null,
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Confirm Changes card — visible only when a time is selected
              if (_selectedTime != null) ...[
                const SizedBox(height: 16),
                AnimatedOpacity(
                  opacity: _selectedTime != null ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: _Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Confirm Changes',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Old → New appointment row
                        Row(
                          children: [
                            // Current appointment box
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFB),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xFFE5E7EB)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Current Appointment',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF9CA3AF),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'March 25, 2024',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF111827),
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '10:00 AM',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF6B7280),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Arrow
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                              child: const Icon(Icons.arrow_forward,
                                  color: Color(0xFF6B7280), size: 18),
                            ),

                            // New appointment box
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF6FF),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xFFBFDBFE)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'New Appointment',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF93C5FD),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      _selectedDate != null
                                          ? '${_monthLabel(_selectedDate!).split(' ')[0]} ${_selectedDate!.day}, ${_selectedDate!.year}'
                                          : '—',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1D4ED8),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      _selectedTime ?? '—',
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF3B82F6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Reason text field
                        const Text(
                          'Reason for Rescheduling (Optional)',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF374151),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          maxLines: 4,
                          style: const TextStyle(
                              fontSize: 13, color: Color(0xFF374151)),
                          decoration: InputDecoration(
                            hintText: "Let us know why you're rescheduling...",
                            hintStyle: const TextStyle(
                                fontSize: 13, color: Color(0xFFD1D5DB)),
                            filled: true,
                            fillColor: const Color(0xFFF9FAFB),
                            contentPadding: const EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: Color(0xFFE5E7EB)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: Color(0xFFE5E7EB)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: Color(0xFF2563EB)),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2563EB),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 13),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Confirm Reschedule',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: OutlinedButton(
                                onPressed: () =>
                                    setState(() => _selectedTime = null),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Color(0xFFE5E7EB)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 13),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF374151),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Calendar Widget ──────────────────────────────────────────────────────────

class _CalendarWidget extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime? selectedDate;
  final String monthLabel;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final ValueChanged<DateTime> onDateSelected;

  const _CalendarWidget({
    required this.focusedMonth,
    required this.selectedDate,
    required this.monthLabel,
    required this.onPrevious,
    required this.onNext,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
    DateUtils.getDaysInMonth(focusedMonth.year, focusedMonth.month);
    final firstWeekday =
        DateTime(focusedMonth.year, focusedMonth.month, 1).weekday %
            7; // Sun=0

    const dayHeaders = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    return Column(
      children: [
        // Month navigation
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onPrevious,
              child: const Icon(Icons.chevron_left,
                  color: Color(0xFF6B7280), size: 22),
            ),
            Text(
              monthLabel,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            GestureDetector(
              onTap: onNext,
              child: const Icon(Icons.chevron_right,
                  color: Color(0xFF6B7280), size: 22),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Day headers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dayHeaders
              .map((d) => SizedBox(
            width: 36,
            child: Center(
              child: Text(
                d,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ),
          ))
              .toList(),
        ),
        const SizedBox(height: 8),

        // Day grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemCount: firstWeekday + daysInMonth,
          itemBuilder: (context, index) {
            if (index < firstWeekday) return const SizedBox();
            final day = index - firstWeekday + 1;
            final date =
            DateTime(focusedMonth.year, focusedMonth.month, day);
            final isSelected = selectedDate != null &&
                selectedDate!.year == date.year &&
                selectedDate!.month == date.month &&
                selectedDate!.day == date.day;

            return GestureDetector(
              onTap: () => onDateSelected(date),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF2563EB)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$day',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF374151),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ─── Time Slot Chip ───────────────────────────────────────────────────────────

class _TimeSlotChip extends StatelessWidget {
  final String label;
  final bool enabled;
  final bool selected;
  final VoidCallback? onTap;

  const _TimeSlotChip({
    required this.label,
    required this.enabled,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    Color borderColor;

    if (selected) {
      bgColor = const Color(0xFF2563EB);
      textColor = Colors.white;
      borderColor = const Color(0xFF2563EB);
    } else if (!enabled) {
      bgColor = Colors.white;
      textColor = const Color(0xFFD1D5DB);
      borderColor = const Color(0xFFE5E7EB);
    } else {
      bgColor = Colors.white;
      textColor = const Color(0xFF374151);
      borderColor = const Color(0xFFE5E7EB);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Card wrapper ─────────────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  final Widget child;

  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
