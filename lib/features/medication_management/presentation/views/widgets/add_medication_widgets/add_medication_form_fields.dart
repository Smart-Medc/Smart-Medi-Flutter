import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_medi/core/helpers/auth_helper.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/labeled_form_field.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_model/add_medication_request.dart';
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

  Future<void> _handleAddMedication(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      if (!context.mounted) return;
      context.showSnackBar(const Text('Please fill all required fields'));
      return;
    }

    try {
      final startDate = DateFormat('yyyy-MM-dd').parseStrict(
        widget.startDateController.text.trim(),
      );
      final addMedicationRequest = AddMedicationRequest(
        name: widget.medicationNameController.text,
        dosage: widget.dosageController.text,
        frequency: widget.dosageFrequencyController.text,
        route: widget.dosageRouteController.text,
        instructions: null,
        startDate: startDate,
        endDate: null,
        prescribingDoctor: widget.prescribingDoctorController.text,
      );

      // Get patientId from secure storage
      final patientId = await SecureStorageHelper.getPatientId();

      if (!context.mounted) return;

      if (patientId != null && patientId.isNotEmpty) {
        context.read<AddMedicationCubit>().addMedication(
          addMedicationRequest: addMedicationRequest,
          patientId: patientId,
        );
      } else {
        // Logout user and navigate to login screen
        await AuthHelper.logout();
        if (!context.mounted) return;
        GoRouter.of(context).pushReplacement(AppRoutes.loginView);
        context.showSnackBar(const Text('Session expired. Please login again.'));
      }
    } catch (e) {
      if (!context.mounted) return;
      context.showSnackBar(const Text('Invalid date format. Use yyyy-MM-dd'));
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
              hintText: 'yyyy-MM-dd',
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
