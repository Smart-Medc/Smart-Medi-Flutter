import 'package:flutter/material.dart';

class AppointmentsRescheduleHeader extends StatelessWidget {
  const AppointmentsRescheduleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back button
        GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 20),

        // Title
        const Text(
          'Reschedule Appointment',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Select a new date and time for your appointment',
          style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
        ),
        const SizedBox(height: 20),

        // Policy banner
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFBFDBFE)),
          ),
          padding: const EdgeInsets.all(14),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline,
                color: Color(0xFF2563EB),
                size: 18,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rescheduling Policy',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E40AF),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'You can reschedule this appointment up to 24 hours before the scheduled time. This is your first reschedule for this appointment.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF3B82F6),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
