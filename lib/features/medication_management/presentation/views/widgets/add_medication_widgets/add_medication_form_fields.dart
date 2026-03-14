import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/labeled_form_field.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_request.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/add_medication_cubit/add_medication_cubit.dart';

class AddMedicationFormFields extends StatefulWidget {
  const AddMedicationFormFields({
    super.key,
    required this.medicationNameController,
    required this.dosageController,
    required this.dosageFrequencyController,
    required this.dosageRouteController,
    required this.startDateController,
    required this.prescribingDoctorController,
  });

  final TextEditingController medicationNameController;
  final TextEditingController dosageController;
  final TextEditingController dosageFrequencyController;
  final TextEditingController dosageRouteController;
  final TextEditingController startDateController;
  final TextEditingController prescribingDoctorController;

  @override
  State<AddMedicationFormFields> createState() => _AddMedicationFormFieldsState();
}

class _AddMedicationFormFieldsState extends State<AddMedicationFormFields> {
  final _formKey = GlobalKey<FormState>();

  void _handleAddMedication(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final startDate = DateTime.parse(widget.startDateController.text);
      final addMedicationRequest = AddMedicationRequest(
        name: widget.medicationNameController.text,
        dosage: widget.dosageController.text,
        frequency: widget.dosageFrequencyController.text,
        route: widget.dosageRouteController.text,
        instructions: '',
        startDate: startDate,
        endDate: null,
        prescribingDoctor: widget.prescribingDoctorController.text,
      );

      context.read<AddMedicationCubit>().addMedication(
        addMedicationRequest: addMedicationRequest,
        patientId: '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CardContainer(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledFormField(
              label: 'Medication Name',
              controller: widget.medicationNameController,
              hintText: 'Enter medication name',
              isRequired: true,
              validator: (value) => Validator.requiredValidator(value, 'Medication name is required'),
            ),
            16.verticalSpace,
            LabeledFormField(
              label: 'Dosage',
              controller: widget.dosageController,
              hintText: 'eg. 500mg',
              isRequired: true,
              validator: (value) => Validator.requiredValidator(value, 'Dosage is required'),
            ),
            16.verticalSpace,
            LabeledFormField(
              label: 'Dosage Frequency',
              controller: widget.dosageFrequencyController,
              hintText: 'eg. Twice daily',
              isRequired: true,
              validator: (value) => Validator.requiredValidator(value, 'Dosage frequency is required'),
            ),
            16.verticalSpace,
            LabeledFormField(
              label: 'Dosage Route',
              controller: widget.dosageRouteController,
              hintText: 'eg. Oral',
              isRequired: true,
              validator: (value) => Validator.requiredValidator(value, 'Dosage route is required'),
            ),
            16.verticalSpace,
            LabeledFormField(
              label: 'Start Date',
              controller: widget.startDateController,
              hintText: 'mm/dd/yyyy',
              isDate: true,
              isRequired: true,
              validator: (value) => Validator.requiredValidator(value, 'Start date is required'),
            ),
            16.verticalSpace,
            LabeledFormField(
              label: 'Prescribing Doctor',
              controller: widget.prescribingDoctorController,
              hintText: 'Enter doctor\'s name',
              isRequired: true,
              validator: (value) => Validator.requiredValidator(value, 'Prescribing doctor is required'),
            ),
            24.verticalSpace,
            ActionButtons(
              primaryButtonText: 'Add Medication',
              onPrimaryPressed: () {
                _handleAddMedication(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
