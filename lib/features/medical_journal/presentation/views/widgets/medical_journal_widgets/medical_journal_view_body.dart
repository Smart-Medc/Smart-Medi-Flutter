import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
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
            const JournalEntryCard(
              title: 'Feeling much better Today',
              date: 'Mar 18, 2024',
              time: '10:30 AM',
              description: 'Woke up with more energy. The new medication seems to be working well ...',
              mood: '8/10',
              pain: '3/10',
              tags: ['Headache'],
            ),
            16.verticalSpace,
            const JournalEntryCard(
              title: 'Morning Headache',
              date: 'Mar 17, 2024',
              time: '08:15 AM',
              description: 'Started the day with a mild headache. Took prescribed medication and rested for an hour ...',
              mood: '6/10',
              pain: '5/10',
              tags: ['Headache',],
            ),
            16.verticalSpace,
            const JournalEntryCard(
              title: 'Good Sleep Quality',
              date: 'Mar 16, 2024',
              time: '09:00 PM',
              description: 'Had a restful night with 8 hours of continuous sleep. Feeling refreshed in the morning ...',
              mood: '9/10',
              pain: '2/10',
              tags: ['Sleep'],
            ),
            16.verticalSpace,
            const JournalEntryCard(
              title: 'Afternoon Fatigue',
              date: 'Mar 15, 2024',
              time: '02:45 PM',
              description: 'Experiencing unusual tiredness after lunch. Might need to adjust meal timing ...',
              mood: '5/10',
              pain: '4/10',
              tags: ['Fatigue'],
            ),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}

