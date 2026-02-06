import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/edit_medication_widgets/edit_medication_view_body.dart';

class EditMedicationView extends StatelessWidget {
  const EditMedicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: EditMedicationViewBody(),
      ),
    );
  }
}

