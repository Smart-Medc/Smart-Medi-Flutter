import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'widgets/active_session_banner.dart';
import 'widgets/patient_info_card.dart';
import 'widgets/data_protection_notice.dart';
import 'widgets/medical_record_item.dart';

class AccessPatientDataView extends StatelessWidget {
  const AccessPatientDataView({super.key});

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
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(height: 10.h),
                const ActiveSessionBanner(),
                SizedBox(height: 20.h),
                const PatientInfoCard(),
                SizedBox(height: 20.h),
                const DataProtectionNotice(),
                SizedBox(height: 30.h),
                Text('Shared Medical Records', style: AppStyles.textStyle18W700Black),
                SizedBox(height: 16.h),
                const MedicalRecordItem(
                  title: 'Annual Physical Examination',
                  date: '3/15/2024',
                  doctor: 'Dr. Sarah Johnson',
                  tag: 'Checkup',
                  icon: Icons.assignment_outlined,
                ),
                const MedicalRecordItem(
                  title: 'Blood Test Results',
                  date: '3/10/2024',
                  doctor: 'Dr. Michael Chen',
                  tag: 'Lab Results',
                  icon: Icons.biotech_outlined,
                ),
                const MedicalRecordItem(
                  title: 'Chest X-Ray',
                  date: '2/28/2024',
                  doctor: 'Dr. Emily Roberts',
                  tag: 'Imaging',
                  icon: Icons.image_outlined,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
