import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';

class AddJournalEntryActionButtons extends StatelessWidget {
  const AddJournalEntryActionButtons({
    super.key,
    this.onSavePressed,
    this.onCancelPressed,
    this.primaryButtonText = 'Save Entry',
  });

  final VoidCallback? onSavePressed;
  final VoidCallback? onCancelPressed;
  final String primaryButtonText;

  @override
  Widget build(BuildContext context) {
    return ActionButtons(
      primaryButtonText: primaryButtonText,
      onPrimaryPressed: onSavePressed,
      onCancelPressed: onCancelPressed,
    );
  }
}

