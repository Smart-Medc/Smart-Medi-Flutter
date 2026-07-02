import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointment_details_models/get_appointment_details_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_actions_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_information.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_medical_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_policy_cancellation.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_reminder_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_shared_Record.dart';
class AppointmentDetailsContent extends StatelessWidget {
  const AppointmentDetailsContent({super.key, required this.appointmentDetails});
  final GetAppointmentDetailsResponse appointmentDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppointmentsDetailsMedicalCard(appointmentDetails: appointmentDetails),
        12.verticalSpace,
        AppointmentsDetailsInformation(appointmentDetails: appointmentDetails),
        12.verticalSpace,
        if (appointmentDetails.isRecordsShared) AppointmentsDetailsSharedRecord(accessCode: appointmentDetails.accessCode ?? 'There is no access code available.') else const SizedBox(),
        12.verticalSpace,
        const AppointmentsDetailsActionsCard(),
        12.verticalSpace,
        const AppointmentsDetailsReminderCard(),
        12.verticalSpace,
        AppointmentsDetailsPolicyCancellation(cancellationPolicy: appointmentDetails.cancellationPolicy,),
        24.verticalSpace,
      ],
    );
  }
}
