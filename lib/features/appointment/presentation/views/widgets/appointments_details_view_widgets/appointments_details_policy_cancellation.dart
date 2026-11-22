import 'package:flutter/material.dart';

class AppointmentsDetailsPolicyCancellation extends StatelessWidget {
  const AppointmentsDetailsPolicyCancellation({super.key, required this.cancellationPolicy});
  final String cancellationPolicy;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFFED7AA)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
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
          const SizedBox(height: 8),
          Text(
            cancellationPolicy,
            style: const TextStyle(fontSize: 12, color: Color(0xFFC2410C)),
          ),
        ],
      ),
    );
  }
}
