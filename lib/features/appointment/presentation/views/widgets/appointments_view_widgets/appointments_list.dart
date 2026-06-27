import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointment_item.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({super.key, required this.appointments});

  final List<AppointmentModel> appointments;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return AppointmentItem(appointment: appointments[index]);
      },
        childCount: appointments.length,
      ),
    );
  }
}
