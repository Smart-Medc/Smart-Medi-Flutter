import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/appointment_header_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/continue_button_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/date_selector_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/hospital_card_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/time_slots_widget.dart';

class BookAppointmentsView extends StatefulWidget {
  const BookAppointmentsView({super.key});

  @override
  State<BookAppointmentsView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentsView> {
  DateTime _selectedDate = DateTime(2025, 12, 16);

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppointmentHeaderWidget(),
                    const SizedBox(height: 20),
                    const HospitalCardWidget(
                      hospitalName: 'City Medical Center',
                      hospitalTag: 'Hospital',
                      hospitalAddress: '123 Medical Plaza, Downtown',
                    ),
                    const SizedBox(height: 16),

                    DateSelectorWidget(
                      selectedDate: _selectedDate,
                      onDateSelected: _onDateSelected,
                    ),
                    const SizedBox(height: 16),

                    TimeSlotsWidget(
                      selectedDate: _selectedDate,
                      selectedTime: _selectedTime,
                      onTimeSelected: _onTimeSelected,
                    ),
                    const SizedBox(height: 24),
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
        ),
      ),
    );
  }
}
