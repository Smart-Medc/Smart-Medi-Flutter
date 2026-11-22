import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/shared_reusable_widgets.dart';

class AppointmentsDetailsReminderCard extends StatelessWidget {
  const AppointmentsDetailsReminderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.notifications_outlined,
                size: 18,
                color: Colors.black87,
              ),
              SizedBox(width: 8),
              Text(
                'Reminders',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ReminderRow(
            label: '24 hours before',
            tags: ['Email', 'Push'],
            tagColor: Color(0xFF3B82F6),
          ),
          SizedBox(height: 10),
          ReminderRow(
            label: '1 hour before',
            tags: ['SMS', 'Push'],
            tagColor: Color(0xFF8B5CF6),
          ),
        ],
      ),
    );
  }
}
