import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AutoRejectionPolicyCard extends StatelessWidget {
  const AutoRejectionPolicyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xffEDF3FE),
        borderRadius: BorderRadius.circular(18.r),
        border: Border(
          left: BorderSide(
            color: AppColors.iconCyan,
            width: 4.w,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Auto-rejection Policy',
            style: AppStyles.textStyle15W600Black,
          ),
          SizedBox(height: 10.h),
          Text(
            'Requests that are not reviewed within 3 days will be automatically rejected. Patients will be notified and can submit a new request.',
            style: AppStyles.textStyle12W400DarkGrey,
          ),
        ],
      ),
    );
  }
}
