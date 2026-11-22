import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class DetailsStatusCard extends StatelessWidget {
  const DetailsStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Status", style: AppStyles.textStyle12W500DarkGrey),
            const SizedBox(height: 8),
            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.iconBGCyan, borderRadius: BorderRadius.circular(20)),
                child: Text("Pending Review", style: AppStyles.textStyle12W600Black.copyWith(color: AppColors.iconCyan))),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text("Requested", style: AppStyles.textStyle12W500DarkGrey),
            Text("2 hours ago", style: AppStyles.textStyle12W500Black),
          ]),
        ],
      ),
    );
  }
}