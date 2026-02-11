import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';

class AddJournalEntryActionButtons extends StatelessWidget {
  const AddJournalEntryActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActionButtons(primaryButtonText: 'Save Entry',);
  }
}

