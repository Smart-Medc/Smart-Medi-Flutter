import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_patient_appointments_cubit/get_patient_appointments_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointment_content.dart';
class AppointmentBlocBuilder extends StatelessWidget {
  const AppointmentBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPatientAppointmentsCubit, GetPatientAppointmentsState>(
      builder: (context, state) {
        if (state is GetPatientAppointmentsLoading) {
          return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        } else if (state is GetPatientAppointmentsSuccess) {
          final appointments = state.appointmentsResponse;
          return AppointmentContent(appointmentsResponse: appointments);
        } else if (state is GetPatientAppointmentsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text('Error: ${state.message}')));
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
