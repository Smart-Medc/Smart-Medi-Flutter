import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/app_header.dart';

class MedicationManagementHeader extends StatelessWidget {
  const MedicationManagementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      title: 'Medication Management',
      subtitle: 'Track your medications and set reminders',
      actionText: 'Add Medication',
      onActionPressed: () => context.push(AppRoutes.addMedication),
    );
  }
}
