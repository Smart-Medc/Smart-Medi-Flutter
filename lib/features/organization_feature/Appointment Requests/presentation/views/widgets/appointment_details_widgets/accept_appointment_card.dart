import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AcceptAppointmentCard extends StatelessWidget {
  const AcceptAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: const Border(left: BorderSide(color: AppColors.iconGreen, width: 4))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Icon(Icons.check_circle_outline, color: AppColors.iconGreen),
          const SizedBox(width: 8),
          Text("Accept Appointment", style: AppStyles.textStyle15W600Black),
        ]),
        const SizedBox(height: 12),
        Text("Preparation Instructions (Optional)", style: AppStyles.textStyle12W500Black),
        const SizedBox(height: 8),
        TextField(
            maxLines: 3,
            decoration: InputDecoration(
                hintText: "Add any preparation instructions for the patient...",
                hintStyle: AppStyles.textStyle12W400DarkGrey,
                filled: true,
                fillColor: AppColors.formFieldBGColor,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none))),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor, padding: const EdgeInsets.all(16)),
                child: Text("Confirm Appointments", style: AppStyles.textStyle15W600White))),
      ]),
    );
  }
}