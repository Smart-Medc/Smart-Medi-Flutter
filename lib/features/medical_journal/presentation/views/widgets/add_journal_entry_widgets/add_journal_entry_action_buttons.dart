import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';

class AddJournalEntryActionButtons extends StatelessWidget {
  const AddJournalEntryActionButtons({
    super.key,
    this.onSavePressed,
    this.onCancelPressed,
  });

  final VoidCallback? onSavePressed;
  final VoidCallback? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButtons(
      primaryButtonText: 'Save Entry',
      onPrimaryPressed: onSavePressed,
      onCancelPressed: onCancelPressed,
    );
  }
}

