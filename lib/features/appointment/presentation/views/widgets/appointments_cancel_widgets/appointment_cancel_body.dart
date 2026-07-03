import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/appointments_cancel_appointment_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/appointments_cancel_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/reason_for_cancellation_and_policy.dart';

class AppointmentCancelBody extends StatelessWidget {
  const AppointmentCancelBody({super.key, required this.appointment});

  final AppointmentItemModel appointment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppointmentsCancelHeader(),
          16.verticalSpace,
          AppointmentsCancelAppointmentCard(appointment: appointment),
          16.verticalSpace,
          ReasonForCancellationAndPolicy(appointmentId: appointment.id),
        ],
      ),
    );
  }
}
