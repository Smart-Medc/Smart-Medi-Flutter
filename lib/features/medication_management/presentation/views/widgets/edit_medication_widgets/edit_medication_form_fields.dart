import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/labeled_form_field.dart';

class EditMedicationFormFields extends StatelessWidget {
  const EditMedicationFormFields({
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
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledFormField(
            label: 'Medication Name',
            controller: medicationNameController,
            hintText: 'Enter medication name',
            isRequired: true,
            validator: (value) =>
                Validator.requiredValidator(value, 'Medication name is required'),
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Dosage',
            controller: dosageController,
            hintText: 'eg. 500mg',
            isRequired: true,
            validator: (value) =>
                Validator.requiredValidator(value, 'Dosage is required'),
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Dosage Frequency',
            controller: dosageFrequencyController,
            hintText: 'eg. Twice daily',
            isRequired: true,
            validator: (value) =>
                Validator.requiredValidator(value, 'Dosage frequency is required'),
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Dosage Route',
            controller: dosageRouteController,
            hintText: 'eg. Oral',
            isRequired: true,
            validator: (value) =>
                Validator.requiredValidator(value, 'Dosage route is required'),
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Start Date',
            controller: startDateController,
            hintText: 'mm/dd/yyyy',
            isDate: true,
            isRequired: true,
            validator: (value) =>
                Validator.requiredValidator(value, 'Start date is required'),
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Prescribing Doctor',
            controller: prescribingDoctorController,
            hintText: 'Enter doctor\'s name',
            isRequired: true,
            validator: (value) => Validator.requiredValidator(
              value,
              'Prescribing doctor is required',
            ),
          ),
        ],
      ),
    );
  }
}

