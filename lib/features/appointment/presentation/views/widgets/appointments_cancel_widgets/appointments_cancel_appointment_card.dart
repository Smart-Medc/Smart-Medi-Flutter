import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/card_wrapper.dart';

class AppointmentsCancelAppointmentCard extends StatelessWidget {
  const AppointmentsCancelAppointmentCard({super.key, required this.appointment});
  final AppointmentItemModel appointment;
  @override
  Widget build(BuildContext context) {
    return // ── Appointment to cancel card ─────────────────────────────────
    CardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Appointment to Cancel',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.business_outlined,
                  color: Color(0xFF2563EB),
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                appointment.organizationName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 13,
                color: Color(0xFF6B7280),
              ),
              const SizedBox(width: 5),
               Text(
                appointment.formattedDate,
                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
              ),
              const SizedBox(width: 16),
              const Icon(
                Icons.access_time_outlined,
                size: 13,
                color: Color(0xFF6B7280),
              ),
              const SizedBox(width: 5),
               Text(
                appointment.formattedTime,
                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
              ),
            ],
          ),
          const SizedBox(height: 4),
           Text(
            appointment.appointmentNumber,
            style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
          ),
        ],
      ),
    );
  }
}
