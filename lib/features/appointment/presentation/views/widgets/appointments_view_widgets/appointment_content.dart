import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointment_tabs.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_summary.dart';
class AppointmentContent extends StatelessWidget {
  const AppointmentContent({super.key, required this.appointmentsResponse});
  final GetAppointmentsResponse appointmentsResponse;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(child: AppointmentsSummary(appointments: appointmentsResponse)),
      SliverToBoxAdapter(child: 20.verticalSpace),
      AppointmentTabs(appointmentsResponse: appointmentsResponse,),
    ]);
  }
}
