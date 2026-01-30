import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class EditRecordUploadDocuments extends StatelessWidget {
  const EditRecordUploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.formFieldStrokeColor),
        boxShadow: AppShadows.medium,
      ),
      child: Column(
        children: [
          Icon(
            Icons.upload_file,
            size: 48.sp,
            color: AppColors.primaryColor,
          ),
          16.verticalSpace,
          Text(
            'Upload New Documents',
            style: AppStyles.textStyle18W700Black,
          ),
          8.verticalSpace,
          Text(
            'Supports PDF, JPEG, PNG (max 50 MB per file)',
            style: AppStyles.textStyle12W400DarkGrey,
            textAlign: TextAlign.center,
          ),
          16.verticalSpace,
          InkWell(
            onTap: () {
              // Handle file selection
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Select File',
                style: AppStyles.textStyle14W400Black.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

