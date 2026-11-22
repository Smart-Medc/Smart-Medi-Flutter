import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/medical_journal/data/models/get_journals_models/get_journal_response.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/get_medical_journals/get_medical_journals_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/delete_journal_helper.dart';
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
                child: JournalEntryCard(
                  journalEntry: entry,
                  onEdit: () {
                    GoRouter.of(context)
                        .push<bool>(
                          AppRoutes.editJournalEntry,
                          extra: entry,
                        )
                        .then((result) {
                          if (!context.mounted) return;
                          if (result == true) {
                            context
                                .read<GetMedicalJournalsCubit>()
                                .getMedicalJournalsForCurrentPatient();
                          }
                        });
                  },
                  onDelete: () {
                    confirmAndDeleteJournal(
                      context: context,
                      journalId: entry.id,
                      journalTitle: entry.title,
                    );
                  },
                ),
              );
            }, childCount: entries.length),
          ),
      ],
    );
  }
}
