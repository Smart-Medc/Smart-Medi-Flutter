import 'package:flutter/material.dart';
import 'app_back_button.dart';

// ==========================================
// WIDGET: Appointment Details Page Header
// Title + Subtitle + Back Button
// ==========================================

class AppointmentHeader extends StatelessWidget {
  const AppointmentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBackButton(),
        const SizedBox(height: 20),
        const Text(
          'Appointment Details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A2E),
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'View and manage your appointment',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
