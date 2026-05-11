import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/custom_tabs.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/appointment/data/models/dummy%20data.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_list.dart';
import 'package:smart_medi/features/data_sharing/data/models/shared_record_factory.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/shared_records_list.dart';

class AppointmentTabs extends StatelessWidget {
  const AppointmentTabs({super.key});

  @override
  Widget build(BuildContext context) {
    List<AppointmentModel> data = DummyAppointments.dummyAppointments;
    return CustomTabs(
      tabTitles: const ['Upcoming', 'Past Appointments'],
      tabContents: [AppointmentsList(Appointments: data),AppointmentsList(Appointments: data)],
    );
  }
}
