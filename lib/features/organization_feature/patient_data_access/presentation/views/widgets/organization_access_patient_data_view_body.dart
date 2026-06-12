import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/organization_feature/patient_data_access/presentation/views/widgets/recent_access_codes_section.dart';
import 'package:smart_medi/features/organization_feature/patient_data_access/presentation/views/widgets/secure_access_section.dart';

class OrganizationAccessPatientDataViewBody extends StatelessWidget {
  const OrganizationAccessPatientDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SizedBox(height: 20.h),
            const AppHeader(
              title: 'Access Patient Data',
              subtitle: 'Enter a patient-provided access code to view their medical records',
            ),
            SizedBox(height: 24.h),
            const SecureAccessSection(),
            SizedBox(height: 30.h),
            const RecentAccessCodesSection(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

