import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class CodeGeneratedSuccessfully extends StatelessWidget {
  const CodeGeneratedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: 105.w,
            height: 105.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.iconBGGreen,
            ),
            child: Icon(
              Icons.check_circle_outline,
              size: 60.sp,
              color:AppColors.iconGreen,
            ),
          ),
          20.verticalSpace,
          Text(
            'Access Code Generated!',
            style: AppStyles.textStyle24W700Black,
          ),
          10.verticalSpace,
          Text(
            'Share this code with your healthcare provider',
            style: AppStyles.textStyle16W400LightGrey,
          ),
        ],
      ),
    );
  }
}
