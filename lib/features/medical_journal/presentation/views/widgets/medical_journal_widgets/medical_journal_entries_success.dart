import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/medical_journal/data/models/get_journals_models/get_journal_response.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/journal_entry_card.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/medical_journal_summary.dart';
class MedicalJournalEntriesSuccess extends StatelessWidget {
  const MedicalJournalEntriesSuccess({super.key, required this.totalEntries, required this.avgMood, required this.thisMonthEntries, required this.avgPain, required this.entries});
  final int totalEntries;
  final double avgMood;
  final int thisMonthEntries;
  final double avgPain;
  final List<JournalListItem> entries;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicalJournalSummary(
                totalEntries: totalEntries,
                avgMood: avgMood,
                thisMonth: thisMonthEntries,
                avgPain: avgPain,
              ),
              24.verticalSpace,
              Text('Recent Entries', style: AppStyles.textStyle24W600Black),
              16.verticalSpace,
            ],
          ),
        ),
        if (entries.isEmpty)
          SliverToBoxAdapter(
            child: Text(
              'No journal entries yet.',
              style: AppStyles.textStyle14W400DarkGrey,
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final entry = entries[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: JournalEntryCard(journalEntry: entry),
              );
            }, childCount: entries.length),
          ),
      ],
    );
  }
}
