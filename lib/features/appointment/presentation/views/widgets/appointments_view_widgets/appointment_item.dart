import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';

class AppointmentItem extends StatelessWidget {

  const AppointmentItem({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(data: appointment);
  }
}

// ─── Single Card ──────────────────────────────────────────────────────────────

class AppointmentCard extends StatelessWidget {

  const AppointmentCard({super.key, required this.data});
  final AppointmentModel data;

  Color get _statusColor {
    switch (data.status.toLowerCase()) {
      case 'confirmed':
        return const Color(0xFF2563EB);
      case 'pending':
        return const Color(0xFFF59E0B);
      case 'cancelled':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF6B7280);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.business_outlined,
                  color: Color(0xFF2563EB),
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.clinicName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _statusColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        data.status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ── Doctor & Specialty ───────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              '${data.doctorName} • ${data.specialty}',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ── Date / Time / Visit type ─────────────────────────────────────────
          Row(
            children: [
              _InfoChip(icon: Icons.calendar_today_outlined, label: data.date),
              const SizedBox(width: 16),
              _InfoChip(icon: Icons.access_time_outlined, label: data.time),
              const SizedBox(width: 16),
              _InfoChip(
                icon: Icons.location_on_outlined,
                label: data.visitType,
              ),
            ],
          ),

          const SizedBox(height: 6),

          // ── Address ──────────────────────────────────────────────────────────
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 15,
                color: Color(0xFF9CA3AF),
              ),
              const SizedBox(width: 4),
              Text(
                data.address,
                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
              ),
            ],
          ),

          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),
          const SizedBox(height: 12),

          // ── Action Buttons ───────────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.visibility_outlined,
                  label: 'View Details',
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRoutes.appointmentsDetailsView);
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _ActionButton(
                  icon: Icons.sync_outlined,
                  label: 'Reschedule',
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRoutes.appointmentsRescheduleView);
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _ActionButton(
                  icon: Icons.cancel_outlined,
                  label: 'Cancel',
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRoutes.appointmentsCancelView);
                  },
                  isDestructive: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Shared sub-widgets ───────────────────────────────────────────────────────

class _InfoChip extends StatelessWidget {

  const _InfoChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: const Color(0xFF2563EB)),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {

  const _ActionButton({
    required this.icon,
    required this.label,
    this.onTap,
    this.isDestructive = false,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final Color foreground = isDestructive
        ? const Color(0xFFEF4444)
        : const Color(0xFF374151);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDestructive
                ? const Color(0xFFFECACA)
                : const Color(0xFFE5E7EB),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 15, color: foreground),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
