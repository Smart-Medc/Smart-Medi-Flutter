import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/shared_reusable_widgets.dart';

class AppointmentsDetailsActionsCard extends StatelessWidget {
  const AppointmentsDetailsActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Actions',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          ActionButton(
            icon: Icons.sync,
            label: 'Reschedule',
            color: Colors.black87,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          ActionButton(
            icon: Icons.cancel_outlined,
            label: 'Cancel Appointment',
            color: const Color(0xFFEF4444),
            onTap: () {},
          ),
          const SizedBox(height: 8),
          ActionButton(
            icon: Icons.phone_outlined,
            label: 'Contact Organization',
            color: Colors.black87,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
