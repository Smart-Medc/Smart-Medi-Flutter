import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/book_appointment_body.dart';

class BookAppointmentsView extends StatelessWidget {
  const BookAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BookAppointmentBody(),
      ),
    );
  }
}
