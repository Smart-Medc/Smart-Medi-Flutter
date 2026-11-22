import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/data/models/get_organization_details_models/get_organization_details_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/affiliated_doctors_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/contact_information_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/operating_hours_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/organization_details_header.dart';

class AvailableOrganizationDetails extends StatelessWidget {
  const AvailableOrganizationDetails({
    super.key,
    required this.organizationDetails,
    required this.organization,
  });

  final OrganizationDetailsResponse organizationDetails;
  final GetOrganizationsResponse organization;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,

            OrganizationDetailsHeader(
              organization: organization,
              onBookNow: () {
                context.push(AppRoutes.bookAppointmentsView,extra: {
                  'organization': organization,
                });
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text(
                //         'Booking appointment at ${provider.name}...'),
                //     backgroundColor: const Color(0xFF2196F3),
                //     behavior: SnackBarBehavior.floating,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // );
              },
              organizationDetails: organizationDetails,
            ),

            const SizedBox(height: 16),

            // ── 2. Contact Information Card ─────────────────────
            ContactInformationCard(organizationDetails: organizationDetails),

            const SizedBox(height: 16),

            // ── 3. Operating Hours Card ─────────────────────────
            if (organizationDetails.operatingHours.isNotEmpty)
              OperatingHoursCard(hours: organizationDetails.operatingHours),

            if (organizationDetails.operatingHours.isNotEmpty) const SizedBox(height: 16),

            // ── 4. Affiliated Doctors Card ──────────────────────
            if (organizationDetails.doctors.isNotEmpty)
              AffiliatedDoctorsCard(doctors: organizationDetails.doctors),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
