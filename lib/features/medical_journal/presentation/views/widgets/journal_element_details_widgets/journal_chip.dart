import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// A chip widget used to display tags or symptoms in the journal.
class JournalChip extends StatelessWidget {
  const JournalChip({
    super.key,
    required this.label,
    this.color = AppColors.iconCyan,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: AppStyles.textStyle12W500White,
      ),
    );
  }
}

