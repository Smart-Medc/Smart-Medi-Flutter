import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';
import 'package:smart_medi/features/appointment/data/models/get_organization_details_models/get_organization_details_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/specialty_chip.dart';

class OrganizationDetailsHeader extends StatelessWidget {
  const OrganizationDetailsHeader({
    super.key,
    required this.organization,
    required this.organizationDetails,
    this.onBookNow,
  });

  final GetOrganizationsResponse organization;
  final OrganizationDetailsResponse organizationDetails;
  final VoidCallback? onBookNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top row: back button on parent, just header here ──
          Row(
            children: [
              const IconWithBackground(
                icon: Icons.local_hospital_outlined,
                backgroundColor: AppColors.iconBGCyan,
                iconColor: AppColors.iconBlue,
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            organization.name,
                            style: AppStyles.textStyle15W600Black,
                          ),
                        ),
                        6.horizontalSpace,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            organization.type,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFC107),
                          size: 16,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          organization.rating.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '( ${organization.reviewCount.toString()} reviews )',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── Specialty Chips ───────────────────────────
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: organization.specializations
                .map((s) => SpecialtyChip(label: s))
                .toList(),
          ),

          const SizedBox(height: 12),

          // ── Description ───────────────────────────────
          if (organizationDetails.description != null) ...[
            Text(
              organizationDetails.description!,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
          ],
          Center(child: CustomButton(text: 'Book Now', width: 160, onPressed: onBookNow,height: 40,textStyle: AppStyles.textStyle12W500White,)),
        ],
      ),
    );
  }
}
