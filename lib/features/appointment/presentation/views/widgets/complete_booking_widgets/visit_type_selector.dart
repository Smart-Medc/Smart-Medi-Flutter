import 'package:flutter/material.dart';

/// ========================================================
/// VisitTypeSelector
/// Dropdown with expandable list for selecting visit type
/// (First Visit / Follow-up / Specific Concern)
/// ========================================================
class VisitTypeSelector extends StatefulWidget {
  final String? selectedVisitType;
  final ValueChanged<String?> onChanged;

  const VisitTypeSelector({
    super.key,
    required this.selectedVisitType,
    required this.onChanged,
  });

  @override
  State<VisitTypeSelector> createState() => _VisitTypeSelectorState();
}

class _VisitTypeSelectorState extends State<VisitTypeSelector> {
  bool _isOpen = false;

  final List<String> _visitTypes = [
    'FirstVisit',
    'FollowUp',
    'SpecificConcern',
    'AnnualPhysical',
    'LabReview',
    'Consultation',
  ];

  void _toggleDropdown() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  void _selectType(String type) {
    widget.onChanged(type);
    setState(() {
      _isOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Visit Type',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 8),

        // Dropdown Button
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft:
                    _isOpen ? Radius.zero : const Radius.circular(10),
                bottomRight:
                    _isOpen ? Radius.zero : const Radius.circular(10),
              ),
              border: Border.all(
                color: const Color(0xFFDDDDDD),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.selectedVisitType ?? 'Select Visit Type',
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.selectedVisitType != null
                        ? const Color(0xFF1A1A2E)
                        : const Color(0xFF999999),
                  ),
                ),
                AnimatedRotation(
                  turns: _isOpen ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF666666),
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Dropdown List (expanded)
        if (_isOpen)
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border(
                left: BorderSide(color: Color(0xFFDDDDDD)),
                right: BorderSide(color: Color(0xFFDDDDDD)),
                bottom: BorderSide(color: Color(0xFFDDDDDD)),
              ),
            ),
            child: Column(
              children: _visitTypes.map((type) {
                final isSelected = widget.selectedVisitType == type;
                return InkWell(
                  onTap: () => _selectType(type),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFE8F0FE)
                          : Colors.transparent,
                      border: const Border(
                        bottom: BorderSide(
                          color: Color(0xFFE0E0E0),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected
                            ? const Color(0xFF4A90D9)
                            : const Color(0xFF333333),
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
