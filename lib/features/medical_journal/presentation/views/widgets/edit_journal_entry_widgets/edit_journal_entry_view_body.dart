import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/edit_journal_entry_widgets/edit_journal_bloc_listener.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/edit_journal_entry_widgets/edit_journal_entry_form_fields.dart';

class EditJournalEntryViewBody extends StatelessWidget {
  const EditJournalEntryViewBody({
    super.key,
    required this.journalId,
    required this.title,
    required this.content,
    required this.entryDate,
    required this.moodLevel,
    required this.painLevel,
    required this.tags,
    required this.symptoms,
  });

  final String journalId;
  final String title;
  final String content;
  final DateTime entryDate;
  final int moodLevel;
  final int painLevel;
  final List<String> tags;
  final List<String> symptoms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarBackButton(),
          const AppHeader(
            title: 'Edit Journal Entry',
            subtitle: 'Update your daily observations',
          ),
          24.verticalSpace,
          EditJournalBlocListener(
            child: EditJournalEntryFormFields(
              journalId: journalId,
              initialTitle: title,
              initialContent: content,
              initialEntryDate: entryDate,
              initialMoodLevel: moodLevel,
              initialPainLevel: painLevel,
              initialTags: tags,
              initialSymptoms: symptoms,
            ),
          ),
          35.verticalSpace,
        ],
      ),
    );
  }
}