import 'package:flutter/material.dart';

/// ========================================================
/// BookingSummaryCard
/// Displays the summary section at the bottom:
/// Organization, Date, Time, Visit Type, Share Records
/// ========================================================
class BookingSummaryCard extends StatelessWidget {
  final String organization;
  final String date;
  final String time;
  final String visitType;
  final bool shareRecords;

  const BookingSummaryCard({
    super.key,
    required this.organization,
    required this.date,
    required this.time,
    required this.visitType,
    required this.shareRecords,
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
          // Title
          const Text(
            'Booking Summary',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 16),

          // Summary Rows
          _SummaryRow(label: 'Organization', value: organization),
          _SummaryRow(label: 'Date', value: date),
          _SummaryRow(label: 'Time', value: time),
          _SummaryRow(label: 'Visit Type', value: visitType),
          _SummaryRow(
            label: 'Share Records',
            value: shareRecords ? 'Yes' : 'No',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------
// Private helper widget for each summary row
// --------------------------------------------------------
class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF888888),
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          const Divider(
            height: 1,
            thickness: 0.8,
            color: Color(0xFFF2F2F2),
          ),
      ],
    );
  }
}
