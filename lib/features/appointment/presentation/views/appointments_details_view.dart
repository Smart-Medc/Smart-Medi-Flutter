import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_appointment_details_cubit/get_appointment_details_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_body.dart';

class AppointmentsDetailsView extends StatelessWidget {
  const AppointmentsDetailsView({super.key, required this.appointmentId});
  final String appointmentId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        leading: const BackButton(color: Colors.black87),
      ),
      body: BlocProvider(
        create: (context) => GetAppointmentDetailsCubit(getIt<AppointmentRepo>())..getAppointmentDetails(appointmentId: appointmentId),
        child: const AppointmentsDetailsBody(),
      ),
    );
  }
}
