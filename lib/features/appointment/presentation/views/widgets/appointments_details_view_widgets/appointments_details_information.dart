import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointment_details_models/get_appointment_details_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/shared_reusable_widgets.dart';

class AppointmentsDetailsInformation extends StatelessWidget {
  const AppointmentsDetailsInformation({super.key, required this.appointmentDetails});
  final GetAppointmentDetailsResponse appointmentDetails;
  @override
  Widget build(BuildContext context) {
    return  BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Appointment Information',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 14),
          // Date + Time row
          Row(
            children: [
              Expanded(
                child: InfoItem(
                  icon: Icons.calendar_today_outlined,
                  label: 'DATE',
                  value: appointmentDetails.formattedDate,
                ),
              ),
              Expanded(
                child: InfoItem(
                  icon: Icons.access_time_outlined,
                  label: 'Time & Duration',
                  value: '${appointmentDetails.formattedTime} (${appointmentDetails.durationMinutes} minutes)',
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          LabelValue(label: 'Appointment Type', value: appointmentDetails.visitType),
          const SizedBox(height: 12),
          LabelValue(
            label: 'Reason for Visit',
            value: appointmentDetails.reason,
          ),
          const SizedBox(height: 12),
          LabelValueLink(label: 'Appointment ID', value: appointmentDetails.id),
        ],
      ),
    );
  }
}
