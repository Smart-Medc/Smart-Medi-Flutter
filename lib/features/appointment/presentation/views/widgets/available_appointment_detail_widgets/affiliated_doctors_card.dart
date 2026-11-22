import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/get_organization_details_models/get_organization_details_response.dart';

class AffiliatedDoctorsCard extends StatelessWidget {
  final List<DoctorModel> doctors;

  const AffiliatedDoctorsCard({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Section Title ─────────────────────────────
          const Text(
            'Affiliated Doctors',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),

          const SizedBox(height: 14),

          // ── Doctor Rows ───────────────────────────────
          ...doctors.asMap().entries.map((entry) {
            final index = entry.key;
            final doctor = entry.value;
            return Column(
              children: [
                _DoctorRow(doctor: doctor),
                if (index < doctors.length - 1)
                  Divider(
                    color: Colors.grey.shade100,
                    thickness: 1,
                    height: 16,
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

// ─── Sub-widget ───────────────────────────────────────────────────────────────

class _DoctorRow extends StatelessWidget {
  final DoctorModel doctor;

  const _DoctorRow({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar placeholder
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.person_outline_rounded,
            color: Color(0xFF2196F3),
            size: 22,
          ),
        ),

        const SizedBox(width: 12),

        // Name + Specialty
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                doctor.specialization,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),

        // Rating
        Row(
          children: [
            const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 16),
            const SizedBox(width: 3),
            Text(
              doctor.rating.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
