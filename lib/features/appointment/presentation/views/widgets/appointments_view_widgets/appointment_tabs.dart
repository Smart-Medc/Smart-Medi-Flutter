import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/sliver_custom_tab_view.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_list.dart';

class AppointmentTabs extends StatelessWidget {
  const AppointmentTabs({super.key, required this.appointmentsResponse});
  final GetAppointmentsResponse appointmentsResponse;
  @override
  Widget build(BuildContext context) {
    return SliverCustomTabView(
      tabTitles: const ['Upcoming', 'Past Appointments'],
      tabContents: [AppointmentsList(appointments: appointmentsResponse.items),AppointmentsList(appointments: appointmentsResponse.items)],
    );
  }
}
