import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointment_tabs.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_summary.dart';

class AppointmentsViewBody extends StatelessWidget {
  const AppointmentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          const CustomAppBar(),
          const AppointmentsHeader(),
          16.verticalSpace,
          const AppointmentsSummary(),
          20.verticalSpace,
          const Expanded(child: AppointmentTabs()),
        ],
      ),
    );;
  }
}
