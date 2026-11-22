import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';


class PatientRequestItem extends StatelessWidget {
  final String patientName;
  final String timeAgo;

  const PatientRequestItem({
    super.key,
    required this.patientName,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyBackgroundColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            patientName,
            style: AppStyles.textStyle14W400Black,
          ),
          Text(
            timeAgo,
            style: AppStyles.textStyle10W400LightGrey,
          ),
        ],
      ),
    );
  }
}
