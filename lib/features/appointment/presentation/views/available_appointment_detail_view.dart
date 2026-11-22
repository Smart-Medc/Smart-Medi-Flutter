import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_organization_details_cubit/get_organization_details_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/available_appointment_details_body.dart';

class AvailableAppointmentDetailView extends StatelessWidget {
  const AvailableAppointmentDetailView({
    super.key,
    required this.organizationId,
    required this.organization,
  });

  final String organizationId;
  final GetOrganizationsResponse organization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              GetOrganizationDetailsCubit(getIt<AppointmentRepo>())
                ..getOrganizationDetails(organizationId: organizationId),
          child: AvailableAppointmentDetailsBody(organization: organization),
        ),
      ),
    );
  }
}
