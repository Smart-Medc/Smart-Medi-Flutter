import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'widgets/secure_access_section.dart';
import 'widgets/system_validates_section.dart';
import 'widgets/recent_access_codes_section.dart';

class OrganizationAccessPatientDataView extends StatelessWidget {
  const OrganizationAccessPatientDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, size: 28.sp),
                    CircleAvatar(
                      radius: 18.r,
                      backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'), // Dummy image
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  'Access Patient Data',
                  style: AppStyles.textStyle24W700Black,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Enter a patient-provided access code to view their medical records',
                  style: AppStyles.textStyle14W400DarkGrey,
                ),
                SizedBox(height: 24.h),
                const SecureAccessSection(),
                SizedBox(height: 30.h),
                const RecentAccessCodesSection(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
