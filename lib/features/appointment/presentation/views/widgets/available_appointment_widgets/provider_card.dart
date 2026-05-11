import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'specialty_chip.dart';

// ==========================================
// WIDGET: Provider Card
// Displays one hospital/clinic/doctor item
// ==========================================

class ProviderCard extends StatelessWidget {
  final ProviderModel provider;
  final VoidCallback? onViewDetails;
  final VoidCallback? onBookNow;

  const ProviderCard({
    super.key,
    required this.provider,
    this.onViewDetails,
    this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header: Icon + Name + Type ──────────────
          _CardHeader(name: provider.name, type: provider.type),

          const SizedBox(height: 8),

          // ── Rating ───────────────────────────────────
          _RatingRow(rating: provider.rating, reviewCount: provider.reviewCount),

          const SizedBox(height: 8),

          // ── Specialty Chips ───────────────────────────
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: provider.specialties
                .map((s) => SpecialtyChip(label: s))
                .toList(),
          ),

          const SizedBox(height: 10),

          // ── Address ───────────────────────────────────
          _InfoRow(
            icon: Icons.location_on_outlined,
            text: provider.address,
          ),

          const SizedBox(height: 4),

          // ── Next Available ────────────────────────────
          _InfoRow(
            icon: Icons.access_time_rounded,
            text: 'Next: ${provider.nextAvailable}',
          ),

          const SizedBox(height: 14),

          // ── Action Buttons ────────────────────────────
          _CardActions(
            onViewDetails: onViewDetails,
          ),
        ],
      ),
    );
  }
}

// ─── Sub-widgets ──────────────────────────────────────────────────────────────

class _CardHeader extends StatelessWidget {
  final String name;
  final String type;

  const _CardHeader({required this.name, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Provider icon
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.local_hospital_outlined,
            color: Color(0xFF2196F3),
            size: 22,
          ),
        ),
        const SizedBox(width: 10),
        // Name + type
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RatingRow extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const _RatingRow({required this.rating, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 18),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviewCount reviews)',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: Colors.grey.shade500),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _CardActions extends StatelessWidget {
  final VoidCallback? onViewDetails;

  const _CardActions({this.onViewDetails,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // View Details (outlined)
        Expanded(
          child: OutlinedButton(
            onPressed: onViewDetails,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: const Text(
              'View Details',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Book Now (filled)
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => context.push(AppRoutes.bookAppointmentsView),
            icon: const Icon(Icons.calendar_today_rounded, size: 14),
            label: const Text(
              'Book Now',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2196F3),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ],
    );
  }
}
