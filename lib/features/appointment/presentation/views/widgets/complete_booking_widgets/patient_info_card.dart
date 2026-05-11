import 'package:flutter/material.dart';

/// ========================================================
/// PatientInfoCard
/// Displays the "Appointment Details" section with
/// patient name and appointment date/time
/// ========================================================
class PatientInfoCard extends StatelessWidget {
  final String patientName;
  final String appointmentDate;
  final String appointmentTime;

  const PatientInfoCard({
    super.key,
    required this.patientName,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          const Text(
            'Appointment Details',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 12),

          // Patient Info Box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F8FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label Row
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 16,
                      color: Color(0xFF4A90D9),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Patient Information',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A90D9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Patient Name
                Text(
                  patientName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 4),

                // Date & Time
                Text(
                  '$appointmentDate • $appointmentTime',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
