import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class SystemValidatesSection extends StatelessWidget {
  const SystemValidatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('System validates:', style: AppStyles.textStyle12W500Black),
        SizedBox(height: 12.h),
        _buildValidationItem('Code format and existence'),
        SizedBox(height: 8.h),
        _buildValidationItem('Expiration status'),
        SizedBox(height: 8.h),
        _buildValidationItem('Usage count (if one-time use)'),
      ],
    );
  }

  Widget _buildValidationItem(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, color: AppColors.iconGreen, size: 18.sp),
        SizedBox(width: 8.w),
        Text(text, style: AppStyles.textStyle12W400DarkGrey),
      ],
    );
  }
}
