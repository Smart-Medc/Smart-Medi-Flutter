import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AutoRejectionWarningWidget extends StatelessWidget {
  const AutoRejectionWarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.iconBGCyan, // خلفية زرقاء فاتحة
        borderRadius: BorderRadius.circular(8),
        border: const Border(
          left: BorderSide(color: AppColors.iconCyan, width: 4), // حافة جانبية باللون السماوي
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: AppColors.iconCyan, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "This request will be auto-rejected in 3 days if not reviewed",
              style: AppStyles.textStyle12W500DarkGrey.copyWith(color: AppColors.textDarkGrey),
            ),
          ),
        ],
      ),
    );
  }
}