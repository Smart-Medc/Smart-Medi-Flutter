import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointment_item.dart';
import 'package:smart_medi/features/data_sharing/data/models/shared_record_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/shared_record_item.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({
    super.key,
    required this.Appointments,
  });

  final List<AppointmentModel> Appointments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: Appointments.length,
        itemBuilder: (context, index) {
          return AppointmentItem(appointments: Appointments);
        },
      ),
    );
  }
}

