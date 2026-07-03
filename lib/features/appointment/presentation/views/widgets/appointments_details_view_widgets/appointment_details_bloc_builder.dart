import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_appointment_details_cubit/get_appointment_details_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointment_details_content.dart';
class AppointmentDetailsBlocBuilder extends StatelessWidget {
  const AppointmentDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAppointmentDetailsCubit, GetAppointmentDetailsState>(
      builder: (context, state) {
        if (state is GetAppointmentDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAppointmentDetailsSuccess) {
          final appointmentDetails = state.appointmentDetailsResponse;
          return AppointmentDetailsContent(appointmentDetails: appointmentDetails);
        } else if (state is GetAppointmentDetailsFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
