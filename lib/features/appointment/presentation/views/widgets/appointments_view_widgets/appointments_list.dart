import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointment_item.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({super.key, required this.appointments, this.isPast = false});

  final List<AppointmentItemModel> appointments;
  final bool isPast;

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: _EmptyAppointmentsState(),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return AppointmentItem(appointment: appointments[index], isPast: isPast);
        },
        childCount: appointments.length,
      ),
    );
  }
}
class _EmptyAppointmentsState extends StatelessWidget {
  const _EmptyAppointmentsState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_busy,
            size: 60,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 12),
          Text(
            'No Appointments Found',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
