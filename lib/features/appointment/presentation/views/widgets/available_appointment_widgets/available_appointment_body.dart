import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/appointment_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/available_organizations_bloc_builder.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/search_filter_bar.dart';

// ==========================================
// SCREEN 1: Available Appointment View
// Main parent widget that assembles all
// child widgets for the appointments list
// ==========================================

class AvailableAppointmentBody extends StatefulWidget {
  const AvailableAppointmentBody({super.key});

  @override
  State<AvailableAppointmentBody> createState() =>
      _AvailableAppointmentBodyState();
}

class _AvailableAppointmentBodyState extends State<AvailableAppointmentBody> {
  String _searchQuery = '';



  // ── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          // ── 1. Header (Back button + Title + Subtitle) ────────────────
          const AppointmentHeader(),

          const SizedBox(height: 24),

          // ── 2. Search + Filter Bar ────────────────────────────────────
          SearchFilterBar(
            onSearch: (query) => setState(() => _searchQuery = query),
            onFilterTap: () {
              // Filter action placeholder
            },
          ),

          const SizedBox(height: 14),

          // ── 3. Results Count Label ────────────────────────────────────
          // ResultsCountLabel(count: providers.length),
          //
          // const SizedBox(height: 14),

          // ── 4. Provider Cards List ────────────────────────────────────
          const AvailableOrganizationsBlocBuilder(),

          // ── 5. Pagination Bar ─────────────────────────────────────────
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16),
          //   child: PaginationBar(
          //     currentPage: _currentPage,
          //     totalPages: _totalPages,
          //     onPrevious: () {
          //       if (_currentPage > 1) {
          //         setState(() => _currentPage--);
          //       }
          //     },
          //     onNext: () {
          //       if (_currentPage < _totalPages) {
          //         setState(() => _currentPage++);
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

