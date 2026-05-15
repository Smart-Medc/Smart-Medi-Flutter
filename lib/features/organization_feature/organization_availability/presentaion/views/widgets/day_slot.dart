import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// Model for a single time slot
class TimeSlot {
  TimeOfDay fromTime;
  TimeOfDay toTime;

  TimeSlot({
    required this.fromTime,
    required this.toTime,
  });
}

// Main DaySlot Widget
class DaySlotWidget extends StatefulWidget {
  final String dayName;
  final bool initiallyChecked;
  final List<TimeSlot>? initialSlots;

  const DaySlotWidget({
    super.key,
    required this.dayName,
    this.initiallyChecked = true,
    this.initialSlots,
  });

  @override
  State<DaySlotWidget> createState() => _DaySlotWidgetState();
}

class _DaySlotWidgetState extends State<DaySlotWidget> {
  late bool _isChecked;
  late List<TimeSlot> _slots;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initiallyChecked;
    _slots = widget.initialSlots ??
        [
          TimeSlot(
            fromTime: const TimeOfDay(hour: 9, minute: 0),
            toTime: const TimeOfDay(hour: 17, minute: 0),
          ),
          TimeSlot(
            fromTime: const TimeOfDay(hour: 9, minute: 0),
            toTime: const TimeOfDay(hour: 17, minute: 0),
          ),
        ];
  }

  void _addSlot() {
    setState(() {
      _slots.add(
        TimeSlot(
          fromTime: const TimeOfDay(hour: 9, minute: 0),
          toTime: const TimeOfDay(hour: 17, minute: 0),
        ),
      );
    });
  }

  void _removeSlot(int index) {
    setState(() {
      _slots.removeAt(index);
    });
  }

  Future<void> _pickTime({
    required BuildContext context,
    required TimeOfDay initialTime,
    required ValueChanged<TimeOfDay> onTimePicked,
  }) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2979FF),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      onTimePicked(picked);
    }
  }

  String _formatTime(TimeOfDay time) {
    final int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final String minute = time.minute.toString().padLeft(2, '0');
    final String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Checkbox + Day Name
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: _isChecked
                            ? const Color(0xFF2979FF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: _isChecked
                              ? const Color(0xFF2979FF)
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: _isChecked
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.dayName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ],
              ),

              // Add Slot Button
              GestureDetector(
                onTap: _isChecked ? _addSlot : null,
                child: Text(
                  '+ Add Slot',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: _isChecked
                        ? const Color(0xFF1A1A2E)
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),

          // Slots List
          if (_isChecked && _slots.isNotEmpty) ...[
            const SizedBox(height: 14),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _slots.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final slot = _slots[index];
                return _buildSlotRow(context, slot, index);
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSlotRow(BuildContext context, TimeSlot slot, int index) {
    return Row(
      children: [
        // From Time Picker
        Expanded(
          child: _TimePickerField(
            time: slot.fromTime,
            onTap: () => _pickTime(
              context: context,
              initialTime: slot.fromTime,
              onTimePicked: (picked) {
                setState(() {
                  _slots[index].fromTime = picked;
                });
              },
            ),
            formatTime: _formatTime,
          ),
        ),

        // "to" label
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'to',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // To Time Picker
        Expanded(
          child: _TimePickerField(
            time: slot.toTime,
            onTap: () => _pickTime(
              context: context,
              initialTime: slot.toTime,
              onTimePicked: (picked) {
                setState(() {
                  _slots[index].toTime = picked;
                });
              },
            ),
            formatTime: _formatTime,
          ),
        ),

        const SizedBox(width: 8),

        // Delete Button
        GestureDetector(
          onTap: () => _removeSlot(index),
          child: Container(
            padding: const EdgeInsets.all(6),
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.red,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}

// Reusable Time Picker Field Widget
class _TimePickerField extends StatelessWidget {
  final TimeOfDay time;
  final VoidCallback onTap;
  final String Function(TimeOfDay) formatTime;

  const _TimePickerField({
    required this.time,
    required this.onTap,
    required this.formatTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formatTime(time),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const Icon(
              Icons.access_time_rounded,
              size: 20,
              color: Color(0xFF1A1A2E),
            ),
          ],
        ),
      ),
    );
  }
}
