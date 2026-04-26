import 'package:flutter/material.dart';
import 'package:smart_medi/features/appointment/data/models/appointment_model.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/appointment_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/pagination_bar.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/provider_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/results_count_label.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/available_appointment_widgets/search_filter_bar.dart';
import 'available_appointment_detail_view.dart';

// ==========================================
// SCREEN 1: Available Appointment View
// Main parent widget that assembles all
// child widgets for the appointments list
// ==========================================

class AvailableAppointmentView extends StatefulWidget {
  const AvailableAppointmentView({super.key});

  @override
  State<AvailableAppointmentView> createState() =>
      _AvailableAppointmentViewState();
}

class _AvailableAppointmentViewState extends State<AvailableAppointmentView> {
  // ── State Variables ────────────────────────────────────────────────────────
  String _searchQuery = '';
  int _currentPage = 1;
  final int _totalPages = 3;

  List<ProviderModel> get _filteredProviders {
    if (_searchQuery.isEmpty) return sampleProviders;
    return sampleProviders
        .where((p) =>
            p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            p.type.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            p.specialties
                .any((s) => s.toLowerCase().contains(_searchQuery.toLowerCase())))
        .toList();
  }

  // ── Navigation ─────────────────────────────────────────────────────────────
  void _navigateToDetail(ProviderModel provider) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AvailableAppointmentDetailView(provider: provider),
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final providers = _filteredProviders;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

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
              ResultsCountLabel(count: providers.length),

              const SizedBox(height: 14),

              // ── 4. Provider Cards List ────────────────────────────────────
              Expanded(
                child: providers.isEmpty
                    ? _EmptyState()
                    : ListView.builder(
                        itemCount: providers.length,
                        padding: const EdgeInsets.only(bottom: 10),
                        itemBuilder: (context, index) {
                          return ProviderCard(
                            provider: providers[index],
                            onViewDetails: () =>
                                _navigateToDetail(providers[index]),
                            onBookNow: () =>
                                _navigateToDetail(providers[index]),
                          );
                        },
                      ),
              ),

              // ── 5. Pagination Bar ─────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: PaginationBar(
                  currentPage: _currentPage,
                  totalPages: _totalPages,
                  onPrevious: () {
                    if (_currentPage > 1) {
                      setState(() => _currentPage--);
                    }
                  },
                  onNext: () {
                    if (_currentPage < _totalPages) {
                      setState(() => _currentPage++);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Empty State Sub-widget ────────────────────────────────────────────────────

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
