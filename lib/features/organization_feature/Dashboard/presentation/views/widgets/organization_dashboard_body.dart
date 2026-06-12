import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/organization_feature/Dashboard/presentation/views/widgets/organization_summary.dart';
import 'package:smart_medi/features/organization_feature/Dashboard/presentation/views/widgets/patient_access_requests.dart';
import 'package:smart_medi/features/organization_feature/Dashboard/presentation/views/widgets/system_status.dart';
import 'package:smart_medi/features/organization_feature/Dashboard/presentation/views/widgets/todays_schedule.dart';
import 'package:smart_medi/features/organization_feature/Dashboard/presentation/views/widgets/weekly_progress.dart';
class OrganizationDashboardBody extends StatelessWidget {
  const OrganizationDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const AppHeader(title: 'Organization Dashboard', subtitle: 'Manage appointments, patients, and analytics'),
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
    );
  }
}
