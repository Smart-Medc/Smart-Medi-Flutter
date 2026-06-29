import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/affiliated_doctors_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/contact_information_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/operating_hours_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_detail_widgets/provider_detail_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/app_back_button.dart';



// ==========================================
// SCREEN 2: Appointment Detail View
// Main parent widget that assembles all
// child widgets for provider detail page
// ==========================================

class AvailableAppointmentDetailView extends StatelessWidget {

  const AvailableAppointmentDetailView({super.key, required this.organizationId});
  final String organizationId;

  @override
  Widget build(BuildContext context) {
    final provider = sampleProviders[1];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Column(
          children: [
            // ── Top Bar with Back Button ──────────────────────────────────
            _DetailTopBar(),

            // ── Scrollable Content ────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // ── 1. Provider Detail Header Card ──────────────────
                    ProviderDetailHeader(
                      provider: provider,
                      onBookNow: () {
                        context.push(AppRoutes.bookAppointmentsView);
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
                    ),

                    const SizedBox(height: 16),

                    // ── 2. Contact Information Card ─────────────────────
                    ContactInformationCard(provider: provider),

                    const SizedBox(height: 16),

                    // ── 3. Operating Hours Card ─────────────────────────
                    if (provider.operatingHours != null)
                      OperatingHoursCard(hours: provider.operatingHours!),

                    if (provider.operatingHours != null)
                      const SizedBox(height: 16),

                    // ── 4. Affiliated Doctors Card ──────────────────────
                    if (provider.affiliatedDoctors != null)
                      AffiliatedDoctorsCard(
                          doctors: provider.affiliatedDoctors!),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Top Bar Sub-widget ────────────────────────────────────────────────────────

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
