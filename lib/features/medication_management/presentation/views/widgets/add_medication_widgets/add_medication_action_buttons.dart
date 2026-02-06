import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';

class AddMedicationActionButtons extends StatelessWidget {
  const AddMedicationActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButtons(
      primaryButtonText: 'Add Medication',
      onPrimaryPressed: () {
        // Add medication logic
      },
    );
  }
}

