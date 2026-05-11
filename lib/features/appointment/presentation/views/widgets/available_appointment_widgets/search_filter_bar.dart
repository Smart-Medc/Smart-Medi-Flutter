import 'package:flutter/material.dart';

// ==========================================
// WIDGET: Search Bar + Filter Button
// ==========================================

class SearchFilterBar extends StatefulWidget {
  final ValueChanged<String>? onSearch;
  final VoidCallback? onFilterTap;

  const SearchFilterBar({
    super.key,
    this.onSearch,
    this.onFilterTap,
  });

  @override
  State<SearchFilterBar> createState() => _SearchFilterBarState();
}

class _SearchFilterBarState extends State<SearchFilterBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Search Field ──────────────────────────────
        Expanded(
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _controller,
              onChanged: widget.onSearch,
              style: const TextStyle(fontSize: 14, color: Color(0xFF1A1A2E)),
              decoration: InputDecoration(
                hintText: 'Search records by title, type',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                  size: 22,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // ── Filter Button ─────────────────────────────
        GestureDetector(
          onTap: widget.onFilterTap,
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2196F3), Color(0xFF1565C0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2196F3).withOpacity(0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.filter_list_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
