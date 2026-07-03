import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_patient_appointments_cubit/get_patient_appointments_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_view_body.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: BlocProvider(
          create: (context) => GetPatientAppointmentsCubit(getIt<AppointmentRepo>())..getPatientAppointments(),
          child: const AppointmentsViewBody(),
        ),
        drawer: const AppDrawer(selectedItem: DrawerItem.appointments),
      ),
    );
  }
}
