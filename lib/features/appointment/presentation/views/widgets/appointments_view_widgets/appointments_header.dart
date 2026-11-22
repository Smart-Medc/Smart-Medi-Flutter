import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/app_header.dart';

class AppointmentsHeader extends StatelessWidget {
  const AppointmentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      title: 'Appointments',
      subtitle: 'Manage your healthcare appointments',
      actionText: 'Book Appointment',
      onActionPressed: () => context.push(AppRoutes.availableAppointmentView),
    );
  }
}
