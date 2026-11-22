import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_organization_details_cubit/get_organization_details_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/available_organization_details.dart';
class AvailableAppointmentDetailsBlocBuilder extends StatelessWidget {
  const AvailableAppointmentDetailsBlocBuilder({super.key, required this.organization});
  final GetOrganizationsResponse organization;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrganizationDetailsCubit, GetOrganizationDetailsState>(
      builder: (context, state) {
        if (state is GetOrganizationDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetOrganizationDetailsSuccess) {
          final organizationDetails = state.organizationDetailsResponse;
          return AvailableOrganizationDetails(organizationDetails: organizationDetails, organization: organization,);
        } else if (state is GetOrganizationDetailsFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
