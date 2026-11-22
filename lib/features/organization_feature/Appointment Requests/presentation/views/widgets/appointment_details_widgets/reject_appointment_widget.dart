import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class RejectAppointmentWidget extends StatefulWidget {
  const RejectAppointmentWidget({super.key});

  @override
  State<RejectAppointmentWidget> createState() => _RejectAppointmentWidgetState();
}

class _RejectAppointmentWidgetState extends State<RejectAppointmentWidget> {
  String? selectedReason;
  final List<String> reasons = [
    "Fully Booked",
    "Outside Specialty",
    "Insufficient Information",
    "Patient Request",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // الحد الأحمر على اليسار
        border: const Border(
          left: BorderSide(color: AppColors.iconRed, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان
          Row(
            children: [
              const Icon(Icons.cancel_outlined, color: AppColors.iconRed),
              const SizedBox(width: 8),
              Text("Reject Appointment", style: AppStyles.textStyle15W600Black),
            ],
          ),
          const SizedBox(height: 16),
          Text("Rejection Reason (Required)", style: AppStyles.textStyle14W400Black),
          const SizedBox(height: 8),

          // Dropdown
          DropdownButtonFormField<String>(
            value: selectedReason,
            hint: Text("Select reason...", style: AppStyles.textStyle14W400DarkGrey),
            isExpanded: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.formFieldBGColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            items: reasons.map((String reason) {
              return DropdownMenuItem<String>(
                value: reason,
                child: Text(reason, style: AppStyles.textStyle14W400Black),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedReason = value;
              });
            },
          ),

          const SizedBox(height: 24),

          // زر الرفض
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: selectedReason == null ? null : () {},
              icon: const Icon(Icons.cancel_outlined, color: Colors.white),
              label: Text("Reject Appointments", style: AppStyles.textStyle15W600White),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.iconRed,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}