import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/card_wrapper.dart';

class ReasonForCancellationAndPolicy extends StatefulWidget {
  ReasonForCancellationAndPolicy({super.key});

  @override
  State<ReasonForCancellationAndPolicy> createState() =>
      _ReasonForCancellationCardState();
}

class _ReasonForCancellationCardState extends State<ReasonForCancellationAndPolicy> {
  String? _selectedReason;
  bool _policyAccepted = false;
  bool get _canConfirm => _selectedReason != null && _policyAccepted;
  final List<String> _reasons = [
    'Schedule conflict',
    'Feeling better / symptoms resolved',
    'Transportation issues',
    'Financial reasons',
    'Personal emergency',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reason for Cancellation',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 12),
              ...List.generate(_reasons.length, (i) {
                final reason = _reasons[i];
                final isSelected = _selectedReason == reason;
                return GestureDetector(
                  onTap: () => setState(() => _selectedReason = reason),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFEFF6FF)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF2563EB)
                            : Colors.transparent,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF2563EB)
                                  : const Color(0xFFD1D5DB),
                              width: 2,
                            ),
                          ),
                          child: isSelected
                              ? Center(
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF2563EB),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          reason,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? const Color(0xFF1D4ED8)
                                : const Color(0xFF374151),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),


        const SizedBox(height: 16),
        // ── Policy acceptance card ─────────────────────────────────────
        GestureDetector(
          onTap: () => setState(() => _policyAccepted = !_policyAccepted),
          child: CardWrapper(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _policyAccepted
                          ? const Color(0xFF2563EB)
                          : const Color(0xFFD1D5DB),
                      width: 2,
                    ),
                  ),
                  child: _policyAccepted
                      ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'I understand the cancellation policy',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF111827),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Cancellations within 24 hours of the appointment may result in a fee.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),
        // ── Bottom action buttons ──────────────────────────────────────
        Row(
          children: [
            Expanded(
              flex: 3,
              child: ElevatedButton(
                onPressed: _canConfirm ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  disabledBackgroundColor: const Color(0xFFFCA5A5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  elevation: 0,
                ),
                child: const Text(
                  'Confirm Cancellation',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: OutlinedButton(
                onPressed: () => Navigator.maybePop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE5E7EB)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Keep\nAppointment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF374151),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
