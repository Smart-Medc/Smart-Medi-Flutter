import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/organization_feature/Dashboard/presentation/views/widgets/organization_summary.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/todays_schedule.dart';
import 'widgets/weekly_progress.dart';
import 'widgets/patient_access_requests.dart';
import 'widgets/system_status.dart';


class OrganizationDashboardView extends StatelessWidget {
  const OrganizationDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar: CustomAppBar(
        onMenuPressed: () {
          // Handle menu open
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                const DashboardHeader(),
                SizedBox(height: 24.h),
                const OrganizationSummary(),
                SizedBox(height: 20.h),
                const TodaysSchedule(),
                SizedBox(height: 20.h),
                const WeeklyProgress(),
                SizedBox(height: 20.h),
                const PatientAccessRequests(),
                SizedBox(height: 20.h),
                const SystemStatus(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
