import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_utils.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_search_widgets/medication_search_empty_state.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_search_widgets/medication_search_header.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_search_widgets/medication_search_results_list.dart';

class MedicationSearchViewBody extends StatefulWidget {
  const MedicationSearchViewBody({
    super.key,
    required this.medications,
  });

  final List<MedicationModel> medications;

  @override
  State<MedicationSearchViewBody> createState() => _MedicationSearchViewBodyState();
}

class _MedicationSearchViewBodyState extends State<MedicationSearchViewBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim();
    final filteredMedications = widget.medications
        .where((medication) => matchesMedicationQuery(medication, query))
        .toList(growable: false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MedicationSearchHeader(),
          AppSearchBar(
            hintText: 'Search medications',
            showFilter: false,
            controller: _searchController,
            onChanged: (_) => setState(() {}),
          ),
          Row(
            children: [
              Text(
                query.isEmpty
                    ? '${widget.medications.length} medications'
                    : '${filteredMedications.length} result${filteredMedications.length == 1 ? '' : 's'}',
                style: AppStyles.textStyle12W500DarkGrey,
              ),
              const Spacer(),
              if (query.isNotEmpty)
                TextButton(
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                  },
                  child: const Text('Clear'),
                ),
            ],
          ),
          8.verticalSpace,
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: _buildBodyContent(
                query: query,
                filteredMedications: filteredMedications,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyContent({
    required String query,
    required List<MedicationModel> filteredMedications,
  }) {
    if (widget.medications.isEmpty) {
      return const MedicationSearchEmptyState(
        key: ValueKey('empty_all'),
        icon: Icons.medication_outlined,
        title: 'No medications yet',
        subtitle: 'Add medications first, then use search to find them quickly.',
      );
    }

    if (filteredMedications.isEmpty) {
      return MedicationSearchEmptyState(
        key: const ValueKey('empty_filtered'),
        icon: Icons.search_off,
        title: 'No matches found',
        subtitle: 'No medication matches "$query". Try another keyword.',
      );
    }

    return MedicationSearchResultsList(
      key: const ValueKey('search_results'),
      medications: filteredMedications,
    );
  }
}
