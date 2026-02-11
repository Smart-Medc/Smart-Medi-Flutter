import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/medical_journal/data/models/sample_journal_data.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/journal_entry_card.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/medical_journal_summary.dart';

class MedicalJournalViewBody extends StatelessWidget {
  const MedicalJournalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const AppHeader(
              title: 'Medical Journal',
              subtitle: 'Track your symptoms and daily observations',
            ),
            const AppSearchBar(hintText: 'Search journal entries', showFilter: false),
            const MedicalJournalSummary(),
            24.verticalSpace,
            Text('Recent Entries', style: AppStyles.textStyle24W600Black),
            16.verticalSpace,

            // Use sample data entries
            ...SampleJournalData.entries.map((entry) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: JournalEntryCard(journalEntry: entry),
              );
            }),

            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}

