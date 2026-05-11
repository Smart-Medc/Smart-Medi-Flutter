import 'package:flutter/material.dart';

class AppointmentsDetailsHeader extends StatelessWidget {
  const AppointmentsDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Appointment Details',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'View and manage your appointment',
          style: TextStyle(fontSize: 13, color: Colors.black45),
        ),
      ],
    );
  }
}
