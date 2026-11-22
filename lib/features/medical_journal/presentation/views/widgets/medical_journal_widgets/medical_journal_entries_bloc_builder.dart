import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/get_medical_journals/get_medical_journals_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/medical_journal_entries_success.dart';
class MedicalJournalEntriesBlocBuilder extends StatelessWidget {
  const MedicalJournalEntriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMedicalJournalsCubit, GetMedicalJournalsState>(
      builder: (context, state) {
        if (state is GetMedicalJournalsLoading ||
            state is GetMedicalJournalsInitial) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (state is GetMedicalJournalsFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.errorMessage,
                    style: AppStyles.textStyle14W400DarkGrey,
                  ),
                  12.verticalSpace,
                  OutlinedButton(
                    onPressed: () {
                      context
                          .read<GetMedicalJournalsCubit>()
                          .getMedicalJournalsForCurrentPatient();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is GetMedicalJournalsSuccess) {
          final entries = state.getJournalResponse.items;
          final now = DateTime.now();

          final int totalEntries = state.getJournalResponse.totalCount > 0
              ? state.getJournalResponse.totalCount
              : entries.length;
          final int thisMonthEntries = entries
              .where(
                (entry) =>
                    entry.entryDate.year == now.year &&
                    entry.entryDate.month == now.month,
              )
              .length;

          final double avgMood = entries.isEmpty
              ? 0
              : entries
                        .map((entry) => entry.moodLevel)
                        .reduce((a, b) => a + b) /
                    entries.length;

          final double avgPain = entries.isEmpty
              ? 0
              : entries
                        .map((entry) => entry.painLevel)
                        .reduce((a, b) => a + b) /
                    entries.length;

          return MedicalJournalEntriesSuccess(
            totalEntries: totalEntries,
            avgMood: avgMood,
            thisMonthEntries: thisMonthEntries,
            avgPain: avgPain,
            entries: entries,
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
