import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';

// ==========================================
// WIDGET: Contact Information Card
// Address, Phone, Email, Website
// ==========================================

class ContactInformationCard extends StatelessWidget {
  final ProviderModel provider;

  const ContactInformationCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
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
          // Section title
          const Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),

          const SizedBox(height: 16),

          // Address
          _ContactRow(
            icon: Icons.location_on_outlined,
            label: 'Address',
            value: provider.address.isNotEmpty
                ? '${provider.address}\nDowntown, City 12345'
                : '—',
            isMultiLine: true,
          ),

          const _Divider(),

          // Phone
          _ContactRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: provider.phone ?? '—',
          ),

          const _Divider(),

          // Email
          _ContactRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: provider.email ?? '—',
          ),

          const _Divider(),

          // Website
          _ContactRow(
            icon: Icons.language_outlined,
            label: 'Website',
            value: provider.website ?? '—',
            isLink: true,
          ),
        ],
      ),
    );
  }
}

// ─── Sub-widgets ──────────────────────────────────────────────────────────────

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isMultiLine;
  final bool isLink;

  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isMultiLine = false,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment:
            isMultiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          // Icon circle
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF2196F3), size: 18),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  color: isLink
                      ? const Color(0xFF2196F3)
                      : const Color(0xFF1A1A2E),
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade100,
      thickness: 1,
      height: 1,
    );
  }
}
