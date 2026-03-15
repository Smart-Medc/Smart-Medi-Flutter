import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/edit_medication_widgets/edit_medication_action_buttons.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/edit_medication_widgets/edit_medication_form_fields.dart';

class EditMedicationFormSection extends StatelessWidget {
  const EditMedicationFormSection({
    super.key,
    required this.formKey,
    required this.medicationNameController,
    required this.dosageController,
    required this.dosageFrequencyController,
    required this.dosageRouteController,
    required this.startDateController,
    required this.prescribingDoctorController,
    required this.onSave,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController medicationNameController;
  final TextEditingController dosageController;
  final TextEditingController dosageFrequencyController;
  final TextEditingController dosageRouteController;
  final TextEditingController startDateController;
  final TextEditingController prescribingDoctorController;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EditMedicationFormFields(
            medicationNameController: medicationNameController,
            dosageController: dosageController,
            dosageFrequencyController: dosageFrequencyController,
            dosageRouteController: dosageRouteController,
            startDateController: startDateController,
            prescribingDoctorController: prescribingDoctorController,
          ),
          24.verticalSpace,
          EditMedicationActionButtons(onSave: onSave),
        ],
      ),
    );
  }
}

