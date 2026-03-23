import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
            date: _formatDate(journalEntry.entryDate),
            time: _formatTime(journalEntry.entryDate),
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

  String _formatDate(DateTime dateTime) {
    const months = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year}';
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}

