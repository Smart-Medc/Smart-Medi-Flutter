import 'package:flutter/material.dart';

/// ========================================================
/// ReasonForVisitField
/// Multi-line text field for entering the reason for visit
/// with a character counter (max 500 chars)
/// ========================================================
class ReasonForVisitField extends StatefulWidget {
  final TextEditingController controller;

  const ReasonForVisitField({
    super.key,
    required this.controller,
  });

  @override
  State<ReasonForVisitField> createState() => _ReasonForVisitFieldState();
}

class _ReasonForVisitFieldState extends State<ReasonForVisitField> {
  int _charCount = 0;
  static const int _maxChars = 500;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _charCount = widget.controller.text.length;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        RichText(
          text: const TextSpan(
            text: 'Reason for Visit ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A2E),
            ),
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Text Field
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFDDDDDD),
              width: 1,
            ),
          ),
          child: TextField(
            controller: widget.controller,
            maxLines: 5,
            maxLength: _maxChars,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF333333),
            ),
            decoration: const InputDecoration(
              hintText: "Let us know why you're rescheduling...",
              hintStyle: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 14,
              ),
              contentPadding: EdgeInsets.all(14),
              border: InputBorder.none,
              counterText: '',
            ),
          ),
        ),
        const SizedBox(height: 4),

        // Character Counter
        Text(
          '$_charCount/$_maxChars characters',
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF999999),
          ),
        ),
      ],
    );
  }
}
