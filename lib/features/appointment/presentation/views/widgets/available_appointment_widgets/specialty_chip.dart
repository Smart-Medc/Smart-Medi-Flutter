import 'package:flutter/material.dart';

// ==========================================
// WIDGET: Specialty Chip (e.g. Cardiology)
// ==========================================

class SpecialtyChip extends StatelessWidget {
  final String label;

  const SpecialtyChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2196F3).withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF1565C0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
