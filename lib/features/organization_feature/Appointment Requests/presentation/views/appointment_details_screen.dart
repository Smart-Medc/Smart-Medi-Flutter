import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'widgets/appointment_details_screen_body.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: AppointmentDetailsScreenBody(),
      ),
    );
  }
}