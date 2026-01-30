import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';

class MedicalRecordsUploadNewDocument extends StatelessWidget {
  const MedicalRecordsUploadNewDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 15.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.formFieldStrokeColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IconWithBackground(icon: Icons.upload, backgroundColor: AppColors.iconBGBlue, iconColor: AppColors.iconBlue),
          16.verticalSpace,
          Text(
            'Upload New Document',
            style: AppStyles.textStyle15W600Black,
          ),
          Text(
            'Supports PDF, JPEG, PNG (max 50 MB per file) ',
            style: AppStyles.textStyle10W400LightGrey,
          ),
          16.verticalSpace,
          InkWell(
            onTap: (){},
            child: Container(
              width: 88.w,
              height: 28.h,
              decoration: BoxDecoration(
                boxShadow: AppShadows.small,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.formFieldStrokeColor)
              ),
              child: Center(
                child: Text(
                  'Select file',
                  style: AppStyles.textStyle14W400Black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
