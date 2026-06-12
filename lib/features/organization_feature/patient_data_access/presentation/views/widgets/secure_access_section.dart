import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/features/organization_feature/patient_data_access/presentation/views/widgets/system_validates_section.dart';

class SecureAccessSection extends StatelessWidget {
  const SecureAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.verified_user_outlined, color: AppColors.primaryColor, size: 24.sp),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Secure Access', style: AppStyles.textStyle15W600Black),
                  Text('Patient data is protected and read-only', 
                    style: AppStyles.textStyle10W400DarkGrey),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text('Access Code or URL', style: AppStyles.textStyle12W500Black),
          SizedBox(height: 8.h),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter 6-8 character code or full URL',
              hintStyle: AppStyles.textStyle12W400DarkGrey,
              filled: true,
              fillColor: AppColors.formFieldBGColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            ),
          ),
          SizedBox(height: 8.h),
          Text('Accepts alphanumeric codes or URLs with embedded tokens', 
            style: AppStyles.textStyle10W400DarkGrey),
          SizedBox(height: 20.h),
          CustomButton(
            text: 'Access Data',
            onPressed: () {},
          ),
          SizedBox(height: 20.h),
          SystemValidatesSection()
        ],
      ),
    );
  }
}
