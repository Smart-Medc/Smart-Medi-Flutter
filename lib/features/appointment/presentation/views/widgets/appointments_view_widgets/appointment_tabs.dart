import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/sliver_custom_tab_view.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/appointment/data/models/dummy%20data.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_list.dart';

class AppointmentTabs extends StatelessWidget {
  const AppointmentTabs({super.key});

  @override
  Widget build(BuildContext context) {
    List<AppointmentModel> data = DummyAppointments.dummyAppointments;
    return SliverCustomTabView(
      tabTitles: const ['Upcoming', 'Past Appointments'],
      tabContents: [AppointmentsList(appointments: data),AppointmentsList(appointments: data)],
    );
  }
}
