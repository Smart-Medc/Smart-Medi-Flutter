import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/shared_reusable_widgets.dart';

class AppointmentsDetailsInformation extends StatelessWidget {
  const AppointmentsDetailsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Appointment Information',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 14),
          // Date + Time row
          Row(
            children: [
              Expanded(
                child: InfoItem(
                  icon: Icons.calendar_today_outlined,
                  label: 'DATE',
                  value: 'March 25, 2024',
                ),
              ),
              Expanded(
                child: InfoItem(
                  icon: Icons.access_time_outlined,
                  label: 'Time & Duration',
                  value: '10:00 AM (30 minutes)',
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          LabelValue(label: 'Appointment Type', value: 'First Visit'),
          SizedBox(height: 12),
          LabelValue(
            label: 'Reason for Visit',
            value: 'Annual checkup and general health consultation',
          ),
          SizedBox(height: 12),
          LabelValueLink(label: 'Appointment ID', value: 'APT-2024-001'),
        ],
      ),
    );
  }
}
