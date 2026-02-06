import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/labeled_form_field.dart';

class AddMedicationFormFields extends StatelessWidget {
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
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Dosage',
            controller: dosageController,
            hintText: 'eg. 500mg',
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Dosage Frequency',
            controller: dosageFrequencyController,
            hintText: 'eg. Twice daily',
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Dosage Route',
            controller: dosageRouteController,
            hintText: 'eg. Oral',
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Start Date',
            controller: startDateController,
            hintText: 'mm/dd/yyyy',
            isDate: true,
          ),
          16.verticalSpace,
          LabeledFormField(
            label: 'Prescribing Doctor',
            controller: prescribingDoctorController,
            hintText: 'Enter doctor\'s name',
          ),
        ],
      ),
    );
  }
}

