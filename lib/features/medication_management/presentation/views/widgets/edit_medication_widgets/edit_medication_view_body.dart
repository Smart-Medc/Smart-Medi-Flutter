import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/edit_medication_widgets/edit_medication_action_buttons.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/edit_medication_widgets/edit_medication_form_fields.dart';

class EditMedicationViewBody extends StatefulWidget {
  const EditMedicationViewBody({
    super.key,
    required this.medicationId,
    required this.medicationName,
    required this.dosage,
    required this.frequency,
    required this.dosageRoute,
    required this.startDate,
    required this.prescribingDoctor,
  });

  final String medicationId;
  final String medicationName;
  final String dosage;
  final String frequency;
  final String dosageRoute;
  final String startDate;
  final String prescribingDoctor;

  @override
  State<EditMedicationViewBody> createState() => _EditMedicationViewBodyState();
}

class _EditMedicationViewBodyState extends State<EditMedicationViewBody> {
  final TextEditingController _medicationNameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _dosageFrequencyController = TextEditingController();
  final TextEditingController _dosageRouteController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _prescribingDoctorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _medicationNameController.text = widget.medicationName;
    _dosageController.text = widget.dosage;
    _dosageFrequencyController.text = widget.frequency;
    _dosageRouteController.text = widget.dosageRoute;
    _startDateController.text = widget.startDate;
    _prescribingDoctorController.text = widget.prescribingDoctor;
  }

  @override
  void dispose() {
    _medicationNameController.dispose();
    _dosageController.dispose();
    _dosageFrequencyController.dispose();
    _dosageRouteController.dispose();
    _startDateController.dispose();
    _prescribingDoctorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarBackButton(),
              const AppHeader(
                title: 'Edit Medication',
                subtitle: 'Update your medication information',
              ),
              16.verticalSpace,
              EditMedicationFormFields(
                medicationNameController: _medicationNameController,
                dosageController: _dosageController,
                dosageFrequencyController: _dosageFrequencyController,
                dosageRouteController: _dosageRouteController,
                startDateController: _startDateController,
                prescribingDoctorController: _prescribingDoctorController,
              ),
              24.verticalSpace,
              const EditMedicationActionButtons(),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

