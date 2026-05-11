import 'package:flutter/material.dart';

/// ========================================================
/// ConsentCheckboxes
/// Two checkbox options:
///   1. Share Medical Records
///   2. I agree to the cancellation policy
/// ========================================================
class ConsentCheckboxes extends StatelessWidget {
  final bool shareMedicalRecords;
  final bool agreeCancellationPolicy;
  final ValueChanged<bool?> onShareMedicalRecordsChanged;
  final ValueChanged<bool?> onAgreeCancellationPolicyChanged;

  const ConsentCheckboxes({
    super.key,
    required this.shareMedicalRecords,
    required this.agreeCancellationPolicy,
    required this.onShareMedicalRecordsChanged,
    required this.onAgreeCancellationPolicyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Item 1: Share Medical Records
          _ConsentItem(
            value: shareMedicalRecords,
            onChanged: onShareMedicalRecordsChanged,
            title: 'Share Medical Records',
            subtitle:
                'An access code will be generated automatically for the healthcare provider',
            showDivider: true,
          ),

          // Item 2: Agree to cancellation policy
          _ConsentItem(
            value: agreeCancellationPolicy,
            onChanged: onAgreeCancellationPolicyChanged,
            title: 'I agree to the cancellation policy',
            subtitle:
                'Cancellations must be made at least 24 hours before the appointment',
            showDivider: false,
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------
// Private helper widget for each checkbox row
// --------------------------------------------------------
class _ConsentItem extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;
  final String subtitle;
  final bool showDivider;

  const _ConsentItem({
    required this.value,
    required this.onChanged,
    required this.title,
    required this.subtitle,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Radio-style checkbox
              GestureDetector(
                onTap: () => onChanged(!value),
                child: Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: value
                          ? const Color(0xFF4A90D9)
                          : const Color(0xFFBBBBBB),
                      width: 2,
                    ),
                  ),
                  child: value
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF4A90D9),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 12),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF888888),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF0F0F0),
            indent: 46,
          ),
      ],
    );
  }
}
