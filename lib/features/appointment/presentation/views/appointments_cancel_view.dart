import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/cancel_appointment_cubit/cancel_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/appointment_cancel_body.dart';

class AppointmentsCancelView extends StatelessWidget {
  const AppointmentsCancelView({super.key, required this.appointment});
  final AppointmentItemModel appointment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CancelAppointmentCubit(getIt<AppointmentRepo>()),
          child: AppointmentCancelBody(appointment: appointment),
        ),
      ),
    );
  }
}

