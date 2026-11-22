import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/features/medical_journal/data/models/get_journals_models/get_journal_response.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/journal_element_details_widgets/journal_element_details_title.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/journal_element_details_widgets/journal_entry_section.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/journal_element_details_widgets/journal_metrics_section.dart';

class JournalElementDetailsViewBody extends StatelessWidget {
  const JournalElementDetailsViewBody({
    super.key,
    required this.journalEntry,
  });

  final JournalListItem journalEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarBackButton(),
          JournalElementDetailsTitle(
            title: journalEntry.title,
            date: DateFormat.yMMMd().format(journalEntry.entryDate),
            time: DateFormat.jm().format(journalEntry.entryDate),
          ),
          24.verticalSpace,
          // Mood and Pain metrics
          JournalMetricsSection(
            mood: journalEntry.moodLevel.toString(),
            pain: journalEntry.painLevel.toString(),
          ),
          24.verticalSpace,
          JournalEntrySection(journalEntry: journalEntry,),
          32.verticalSpace,
          CustomButton(
            onPressed: () => GoRouter.of(context).pop(),
            text: 'Back To Journal',
            height: 59.h,
          ),
          16.verticalSpace,
        ],
      ),
    );
  }

}

