import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';


class AppointmentsSummary extends StatelessWidget {
  const AppointmentsSummary({
    super.key,
    required this.appointments,
  });

  final GetAppointmentsResponse appointments;

  @override
  Widget build(BuildContext context) {
    final upcomingCount = appointments.items
        .where((e) => e.status.toLowerCase() == 'upcoming')
        .length;

    final cancelledCount = appointments.items
        .where((e) => e.status.toLowerCase() == 'cancelled')
        .length;

    final completedCount = appointments.items
        .where((e) => e.status.toLowerCase() == 'completed')
        .length;

    AppointmentItemModel? nextAppointment;

    final upcomingAppointments = appointments.items
        .where((e) =>
    e.date.isAfter(DateTime.now()) &&
        e.status.toLowerCase() == 'upcoming')
        .toList();

    upcomingAppointments.sort((a, b) => a.date.compareTo(b.date));

    if (upcomingAppointments.isNotEmpty) {
      nextAppointment = upcomingAppointments.first;
    }

    return SummaryBox(
      items: [
        SummaryBoxItem.line(
          title: 'Upcoming',
          value: upcomingCount.toString(),
        ),
        SummaryBoxItem.line(
          title: 'Cancelled',
          value: cancelledCount.toString(),
        ),
        SummaryBoxItem.line(
          title: 'Completed',
          value: completedCount.toString(),
        ),
        SummaryBoxItem.line(
          title: 'Next Appointment',
          value: nextAppointment != null
              ? '${nextAppointment.date.day}/${nextAppointment.date.month}'
              : '--',
        ),
      ],
    );
  }
}