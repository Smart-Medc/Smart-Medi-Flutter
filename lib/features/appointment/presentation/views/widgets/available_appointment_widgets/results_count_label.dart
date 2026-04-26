import 'package:flutter/material.dart';

// ==========================================
// WIDGET: Results Count Label
// e.g. "Showing 5 results"
// ==========================================

class ResultsCountLabel extends StatelessWidget {
  final int count;

  const ResultsCountLabel({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Showing $count results',
      style: TextStyle(
        fontSize: 13,
        color: Colors.grey.shade500,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
