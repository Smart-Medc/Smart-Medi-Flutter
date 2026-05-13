import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class RecentAccessCodesSection extends StatelessWidget {
  const RecentAccessCodesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Access Codes', style: AppStyles.textStyle15W600Black),
              Icon(Icons.access_time, size: 20.sp, color: AppColors.textLightGrey),
            ],
          ),
          SizedBox(height: 16.h),
          _buildAccessCodeItem(
            name: 'Emma Thompson',
            code: 'ABC123XY',
            accessed: '2 hours ago',
            expires: '22 hours',
          ),
          const Divider(height: 24),
          _buildAccessCodeItem(
            name: 'James Wilson',
            code: 'DEF456ZW',
            accessed: '1 day ago',
            expires: '5 days',
          ),
          const Divider(height: 24),
          _buildAccessCodeItem(
            name: 'Lisa Anderson',
            code: 'GHI789UV',
            accessed: '2 hours ago',
            expires: '5 days',
          ),
        ],
      ),
    );
  }

  Widget _buildAccessCodeItem({
    required String name,
    required String code,
    required String accessed,
    required String expires,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppStyles.textStyle12W600Black),
            Text('Code: $code', style: AppStyles.textStyle10W400LightGrey),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Accessed $accessed', style: AppStyles.textStyle10W400Black),
            Text('Expires in $expires', style: AppStyles.textStyle10W400LightGrey),
          ],
        ),
      ],
    );
  }
}
