import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/data/mock/appointment_requests_mock_data.dart';
import 'appointment_request_card.dart';
import 'appointment_requests_summary.dart';
import 'auto_rejection_policy_card.dart';

class AppointmentRequestsViewBody extends StatelessWidget {
  const AppointmentRequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      child: Column(
        children: [
          const CustomAppBar(),
          SizedBox(height: 30.h),
          const AppointmentRequestsSummary(),
          SizedBox(height: 24.h),
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
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

