import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/data/mock/appointment_requests_mock_data.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_request_card.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_requests_header.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_requests_summary.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_summary_card.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/auto_rejection_policy_card.dart';

class AppointmentRequestsView extends StatelessWidget {
  const AppointmentRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              const AppointmentRequestsHeader(),
              SizedBox(height: 18.h),
              const AppointmentRequestsSummary(),
              SizedBox(height: 14.h),
              ...List.generate(
                appointmentRequests.length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 14.h),
                  child: AppointmentRequestCard(
                    request: appointmentRequests[index],
                  ),
                ),
              ),
              const AutoRejectionPolicyCard(),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
