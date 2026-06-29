import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/available_appointment_details_bloc_builder.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/app_back_button.dart';
class AvailableAppointmentDetailsBody extends StatelessWidget {
  const AvailableAppointmentDetailsBody({super.key, required this.organization});
  final GetOrganizationsResponse organization;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DetailTopBar(),
       AvailableAppointmentDetailsBlocBuilder(organization: organization),
      ],
    );
  }
}
class _DetailTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          AppBackButton(
            onTap: () => GoRouter.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
