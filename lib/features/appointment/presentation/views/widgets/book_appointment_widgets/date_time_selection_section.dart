import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_days/get_availability_days_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/date_selector_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/time_slots_widget.dart';

class DateTimeSelectionSection extends StatelessWidget {
  final DateTime selectedDate;
  final String? selectedTime;
  final List<GetAvailabilityDaysResponse> availabilityDays;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<String> onTimeSelected;

  const DateTimeSelectionSection({
    super.key,
    required this.selectedDate,
    this.selectedTime,
    required this.availabilityDays,
    required this.onDateSelected,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateSelectorWidget(
          selectedDate: selectedDate,
          availabilityDays: availabilityDays,
          onDateSelected: onDateSelected,
        ),
        16.verticalSpace,
        TimeSlotsWidget(
          selectedDate: selectedDate,
          selectedTime: selectedTime,
          onTimeSelected: onTimeSelected,
        ),
      ],
    );
  }
}
