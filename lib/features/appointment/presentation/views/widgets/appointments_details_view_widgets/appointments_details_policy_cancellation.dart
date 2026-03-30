import 'package:flutter/material.dart';

class AppointmentsDetailsPolicyCancellation extends StatelessWidget {
  const AppointmentsDetailsPolicyCancellation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFFED7AA)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, size: 18, color: Color(0xFFF97316)),
              SizedBox(width: 8),
              Text(
                'Cancellation Policy',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9A3412),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Cancellations must be made at least 24 hours before the appointment. Late cancellations may incur a fee.',
            style: TextStyle(fontSize: 12, color: Color(0xFFC2410C)),
          ),
        ],
      ),
    );
  }
}
