import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/edit_journal_cubit/edit_journal_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/edit_journal_entry_widgets/edit_journal_entry_view_body.dart';

class EditJournalEntryView extends StatelessWidget {
  const EditJournalEntryView({
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: BlocProvider(
          create: (context) => EditJournalCubit(getIt<MedicalJournalRepo>()),
          child: EditJournalEntryViewBody(
            journalId: journalId,
            title: title,
            content: content,
            entryDate: entryDate,
            moodLevel: moodLevel,
            painLevel: painLevel,
            tags: tags,
            symptoms: symptoms,
          ),
        ),
      ),
    );
  }
}