import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AppointmentHistoryWidget extends StatelessWidget {
  const AppointmentHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Appointment History", style: AppStyles.textStyle15W600Black),
          const SizedBox(height: 12),
          // يمكنك هنا استخدام ListView.builder إذا كانت البيانات ديناميكية
          _buildHistoryItem("Annual Physical", "Dr. Johnson", "2023-03-20"),
          const SizedBox(height: 8),
          _buildHistoryItem("Follow-up", "Dr. Johnson", "2023-01-15"),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String title, String doctor, String date) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.greyBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyles.textStyle12W600Black),
              Text(doctor, style: AppStyles.textStyle12W400DarkGrey),
            ],
          ),
          Text(date, style: AppStyles.textStyle12W400DarkGrey),
        ],
      ),
    );
  }
}