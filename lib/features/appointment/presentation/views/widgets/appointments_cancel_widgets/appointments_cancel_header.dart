import 'package:flutter/material.dart';

class AppointmentsCancelHeader extends StatelessWidget {
  const AppointmentsCancelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Back ──────────────────────────────────────────────────────
        GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 20),

        // ── Title ─────────────────────────────────────────────────────
        const Text(
          'Cancel Appointment',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Please confirm your cancellation',
          style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
        ),
        const SizedBox(height: 20),

        // ── Warning banner ────────────────────────────────────────────
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFF1F2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFFECACA)),
          ),
          padding: const EdgeInsets.all(14),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFFEF4444),
                size: 20,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Are you sure you want to cancel?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF991B1B),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'This action cannot be undone. The time slot will become available for other patients.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFEF4444),
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
