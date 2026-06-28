import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/app_header.dart';

class AppointmentsDetailsHeader extends StatelessWidget {
  const AppointmentsDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppHeader(title: 'Appointment Details', subtitle: 'View and manage your appointment');
  }
}
