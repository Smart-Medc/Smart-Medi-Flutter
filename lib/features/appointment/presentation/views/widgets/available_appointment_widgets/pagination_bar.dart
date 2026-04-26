import 'package:flutter/material.dart';

// ==========================================
// WIDGET: Pagination Bar
// "< Page 1 of 3 >"
// ==========================================

class PaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const PaginationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPrevious,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous button
        _PaginationArrow(
          icon: Icons.chevron_left_rounded,
          onTap: currentPage > 1 ? onPrevious : null,
        ),

        const SizedBox(width: 16),

        // Page label
        Text(
          'Page $currentPage of $totalPages',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A1A2E),
          ),
        ),

        const SizedBox(width: 16),

        // Next button
        _PaginationArrow(
          icon: Icons.chevron_right_rounded,
          onTap: currentPage < totalPages ? onNext : null,
        ),
      ],
    );
  }
}

class _PaginationArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _PaginationArrow({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: enabled ? Colors.white : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Icon(
          icon,
          size: 20,
          color: enabled ? const Color(0xFF1A1A2E) : Colors.grey.shade400,
        ),
      ),
    );
  }
}
