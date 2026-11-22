import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/patient_info_card.dart';
import 'appointment_details_widgets/accept_appointment_card.dart';
import 'appointment_details_widgets/appointment_history_widget.dart';
import 'appointment_details_widgets/appointment_info_card.dart';
import 'appointment_details_widgets/auto_rejection_warning_widget.dart';
import 'appointment_details_widgets/details_status_card.dart';
import 'appointment_details_widgets/reject_appointment_widget.dart';
import 'appointment_details_widgets/shared_records_card.dart';

class AppointmentDetailsScreenBody extends StatelessWidget {
  const AppointmentDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarBackButton(),
          SizedBox(height: 20.h),
          const AppHeader(
            title: 'Appointment Request Details',
            subtitle: 'Review and manage incoming appointment requests',
          ),
          SizedBox(height: 20.h),
          const DetailsStatusCard(),
          SizedBox(height: 16.h),
          const PatientInfoCard(
            patientName: 'patientName',
            appointmentDate: 'appointmentDate',
            appointmentTime: 'appointmentTime',
          ),
          SizedBox(height: 16.h),
          const AppointmentInfoCard(),
          SizedBox(height: 16.h),
          const SharedRecordsCard(),
          SizedBox(height: 16.h),
          const AcceptAppointmentCard(),
          SizedBox(height: 16.h),
          const RejectAppointmentWidget(),
          SizedBox(height: 16.h),
          AppointmentHistoryWidget(),
          SizedBox(height: 16.h),
          const AutoRejectionWarningWidget(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

