import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/available_appointment_body.dart';
class AvailableAppointmentView extends StatelessWidget {
  const AvailableAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      body: SafeArea(child: AvailableAppointmentBody()),
    );
  }
}
