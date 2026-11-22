import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_organization_cubit/get_organizations_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/available_organizations.dart';

class AvailableOrganizationsBlocBuilder extends StatelessWidget {
  const AvailableOrganizationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrganizationsCubit, GetOrganizationsState>(
      builder: (context, state) {
        if (state is GetOrganizationsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetOrganizationsSuccess) {
          final organizations = state.organizations;
          return AvailableOrganizations(organizations: organizations);
        } else if (state is GetOrganizationsFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
