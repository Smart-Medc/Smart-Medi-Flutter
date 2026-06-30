import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/appointment_header_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/continue_button_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/date_selector_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/hospital_card_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/time_slots_widget.dart';
class BookAppointmentBody extends StatefulWidget {
  const BookAppointmentBody({super.key});

  @override
  State<BookAppointmentBody> createState() => _BookAppointmentBodyState();
}

class _BookAppointmentBodyState extends State<BookAppointmentBody> {
  DateTime _selectedDate = DateTime.now();

  String? _selectedTime;

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
      _selectedTime = null;
    });
  }

  void _onTimeSelected(String time) {
    setState(() {
      _selectedTime = time;
    });
  }

  void _onContinue() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Appointment booked for $_selectedTime on ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppointmentHeaderWidget(),
                  20.verticalSpace,
                  const HospitalCardWidget(
                    hospitalName: 'City Medical Center',
                    hospitalTag: 'Hospital',
                    hospitalAddress: '123 Medical Plaza, Downtown',
                  ),
                  16.verticalSpace,
                  DateSelectorWidget(
                    selectedDate: _selectedDate,
                    onDateSelected: _onDateSelected,
                  ),
                  16.verticalSpace,
                  TimeSlotsWidget(
                    selectedDate: _selectedDate,
                    selectedTime: _selectedTime,
                    onTimeSelected: _onTimeSelected,
                  ),
                24.verticalSpace,
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ContinueButtonWidget(
              selectedTime: _selectedTime,
              onPressed: _onContinue,
            ),
          ),
        ],
    );
  }
}
