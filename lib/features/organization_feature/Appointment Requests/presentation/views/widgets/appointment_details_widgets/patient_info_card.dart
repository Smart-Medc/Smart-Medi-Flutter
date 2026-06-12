import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class PatientInfoCard extends StatelessWidget {
  const PatientInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Patient Information", style: AppStyles.textStyle15W600Black),
        const SizedBox(height: 12),
        Row(children: [
          const CircleAvatar(backgroundColor: AppColors.iconBGBlue, child: Icon(Icons.person, color: AppColors.primaryColor)),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Emma Thompson", style: AppStyles.textStyle15W600Black),
            Text("Age: 32 • Female • Blood Type: A+", style: AppStyles.textStyle12W400DarkGrey),
          ]),
        ]),
        const SizedBox(height: 16),
        Text("Email", style: AppStyles.textStyle10W400DarkGrey),
        Text("emma.thompson@email.com", style: AppStyles.textStyle14W400Black),
        const SizedBox(height: 8),
        Text("Phone", style: AppStyles.textStyle10W400DarkGrey),
        Text("+1 (555) 123-4567", style: AppStyles.textStyle14W400Black),
      ]),
    );
  }
}