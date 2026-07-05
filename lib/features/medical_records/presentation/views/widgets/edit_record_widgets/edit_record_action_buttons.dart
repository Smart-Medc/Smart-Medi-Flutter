import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';

class EditRecordActionButtons extends StatelessWidget {
  const EditRecordActionButtons({super.key, this.onPrimaryPressed});
  final void Function()? onPrimaryPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButtons(
      primaryButtonText: 'Save Changes',
      onPrimaryPressed: onPrimaryPressed,
    );
  }
}
