import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/available_appointment_details_body.dart';
class AvailableAppointmentDetailView extends StatelessWidget {
  const AvailableAppointmentDetailView({
    super.key,
    required this.organizationId,
  });

  final String organizationId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      body: SafeArea(child: AvailableAppointmentDetailsBody()),
    );
  }
}
