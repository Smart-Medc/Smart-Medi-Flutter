import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'app_back_button.dart';

// ==========================================
// WIDGET: Appointment Details Page Header
// Title + Subtitle + Back Button
// ==========================================

class AppointmentHeader extends StatelessWidget {
  const AppointmentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBackButton(),
        20.verticalSpace,
        const AppHeader(title: 'Appointment Details', subtitle: 'View and manage your appointment'),
      ],
    );
  }
}
