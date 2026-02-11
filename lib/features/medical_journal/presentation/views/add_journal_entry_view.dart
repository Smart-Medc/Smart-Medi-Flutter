import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/add_journal_entry_view_body.dart';

class AddJournalEntryView extends StatelessWidget {
  const AddJournalEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: AddJournalEntryViewBody(),
      ),
    );
  }
}

