import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/medical_journal_view_body.dart';

class MedicalJournalView extends StatelessWidget {
  const MedicalJournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: MedicalJournalViewBody(),
        drawer: AppDrawer(selectedItem: DrawerItem.journal),
      ),
    );
  }
}

