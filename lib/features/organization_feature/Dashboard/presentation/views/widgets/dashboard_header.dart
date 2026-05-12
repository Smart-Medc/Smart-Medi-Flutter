import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';


class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organization Dashboard',
          style: AppStyles.textStyle24W700Black,
        ),
        SizedBox(height: 6.h),
        Text(
          'Manage appointments, patients, and analytics',
          style: AppStyles.textStyle14W400DarkGrey,
        ),
      ],
    );
  }
}
