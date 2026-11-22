import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';

class EditRecordActionButtons extends StatelessWidget {
  const EditRecordActionButtons({super.key, this.onPrimaryPressed, required this.isEdit});
  final void Function()? onPrimaryPressed;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return ActionButtons(
      primaryButtonText: isEdit ? 'Save Changes' : 'Create Record',
      onPrimaryPressed: onPrimaryPressed,
    );
  }
}
