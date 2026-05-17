import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/patient_info_card.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_details_widgets/accept_appointment_card.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_details_widgets/appointment_history_widget.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_details_widgets/appointment_info_card.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_details_widgets/auto_rejection_warning_widget.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_details_widgets/details_status_card.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_details_widgets/reject_appointment_widget.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/widgets/appointment_details_widgets/shared_records_card.dart';


class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.black),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Appointment Request Details", style: AppStyles.textStyle24W700Black),
            Text("Review and manage incoming appointment requests",
                style: AppStyles.textStyle14W400DarkGrey),
            const SizedBox(height: 20),
            const DetailsStatusCard(),
            const SizedBox(height: 16),
            const PatientInfoCard(patientName: 'patientName', appointmentDate: 'appointmentDate', appointmentTime: 'appointmentTime',),
            const SizedBox(height: 16),
            const AppointmentInfoCard(),
            const SizedBox(height: 16),
            const SharedRecordsCard(),
            const SizedBox(height: 16),
            const AcceptAppointmentCard(),
            const SizedBox(height: 16),
            const RejectAppointmentWidget(),
            const SizedBox(height: 16),
            AppointmentHistoryWidget(),
            const SizedBox(height: 16),
            const AutoRejectionWarningWidget(),
          ],
        ),
      ),
    );
  }
}