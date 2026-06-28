import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_body.dart';
class AppointmentsDetailsView extends StatelessWidget {
  const AppointmentsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        leading: const BackButton(color: Colors.black87),
      ),
      body: const AppointmentsDetailsBody(),
    );
  }
}
