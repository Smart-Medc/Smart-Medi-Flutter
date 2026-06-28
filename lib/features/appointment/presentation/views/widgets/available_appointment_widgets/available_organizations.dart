import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/available_appointment_detail_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/provider_card.dart';
class AvailableOrganizations extends StatelessWidget {
  const AvailableOrganizations({super.key, required this.organizations});
  final List<GetOrganizationsResponse> organizations;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: organizations.isEmpty
          ? _EmptyState()
          : ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: organizations.length,
        padding: const EdgeInsets.only(bottom: 10),
        itemBuilder: (context, index) {
          return OrganizationCard(
            organization: organizations[index],
            onViewDetails: () =>
                _navigateToDetail(organizations[index], context),
            onBookNow: () => _navigateToDetail(organizations[index], context),
          );
        },
      ),
    );
  }
// ── Navigation ─────────────────────────────────────────────────────────────
  void _navigateToDetail(GetOrganizationsResponse organization, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AvailableAppointmentDetailView(provider: sampleProviders[1]),
      ),
    );
  }
}
class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: 56, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Text(
            'No results found',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}