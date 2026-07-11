import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/app_header.dart';

class AiAssistantHeader extends StatelessWidget {
  const AiAssistantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      title: 'MedGemma AI Assistant',
      subtitle: 'Your personal AI health advisor',
      actionText: 'History',
      actionIcon: Icons.history,
      onActionPressed: () {
        // TODO(routing): navigate to the saved-conversations screen once it exists.
      },
    );
  }
}