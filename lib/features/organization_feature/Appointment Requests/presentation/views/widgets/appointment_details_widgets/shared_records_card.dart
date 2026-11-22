import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class SharedRecordsCard extends StatelessWidget {
  const SharedRecordsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Shared Medical Records", style: AppStyles.textStyle15W600Black),
        const SizedBox(height: 8),
        Text("Patient has shared medical records for your review. Click to access the records viewer.",
            style: AppStyles.textStyle12W400DarkGrey),
        const SizedBox(height: 12),
        OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.description_outlined),
            label: const Text("View Records"),
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.textBlack))
      ]),
    );
  }
}