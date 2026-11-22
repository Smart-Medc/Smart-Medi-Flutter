import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medical_journal/data/models/get_journals_models/get_journal_response.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/journal_element_details_widgets/journal_element_details_view_body.dart';

class JournalElementDetailsView extends StatelessWidget {
  const JournalElementDetailsView({
    super.key,
    required this.journalEntry,
  });

  final JournalListItem journalEntry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: JournalElementDetailsViewBody(
          journalEntry: journalEntry,
        ),
      ),
    );
  }
}

