import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/get_organization_details_models/get_organization_details_response.dart';

class OperatingHoursCard extends StatelessWidget {

  const OperatingHoursCard({super.key, required this.hours});
  final List<OperatingHourModel> hours;

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
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.access_time_rounded,
                  color: Color(0xFF2196F3),
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Operating Hours',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ── Hours Rows ────────────────────────────────
          ...hours.map((h) => _HourRow(hour: h)),
        ],
      ),
    );
  }
}

// ─── Sub-widget ───────────────────────────────────────────────────────────────

class _HourRow extends StatelessWidget {

  const _HourRow({required this.hour});
  final OperatingHourModel hour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hour.day,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            hour.hours,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              // color: hour.isClosed
              //     ? const Color(0xFFE53935)
              //     : const Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }
}
