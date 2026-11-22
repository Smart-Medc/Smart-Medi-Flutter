import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_organization_cubit/get_organizations_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/available_appointment_body.dart';

class AvailableAppointmentView extends StatelessWidget {
  const AvailableAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      body: SafeArea(child: BlocProvider(
          create: (context) => GetOrganizationsCubit(getIt<AppointmentRepo>())..getOrganizations(),
        child: const AvailableAppointmentBody(),
      )),
    );
  }
}
