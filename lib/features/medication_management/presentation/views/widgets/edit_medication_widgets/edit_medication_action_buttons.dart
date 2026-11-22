import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';

class EditMedicationActionButtons extends StatelessWidget {
  const EditMedicationActionButtons({
    super.key,
    required this.onSave,
  });

  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return ActionButtons(
      primaryButtonText: 'Save Changes',
      onPrimaryPressed: onSave,
    );
  }
}

