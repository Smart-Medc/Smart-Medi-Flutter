import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_model/add_medication_request.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/edit_medication_cubit/edit_medication_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/edit_medication_widgets/edit_medication_bloc_listener.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/edit_medication_widgets/edit_medication_form_section.dart';

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
  final _formKey = GlobalKey<FormState>();
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

  Future<void> _handleEditMedication(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      if (!context.mounted) return;
      context.showSnackBar(const Text('Please fill all required fields'));
      return;
    }

    try {
      final editMedicationRequest = AddMedicationRequest(
        name: _medicationNameController.text.trim(),
        dosage: _dosageController.text.trim(),
        frequency: _dosageFrequencyController.text.trim(),
        route: _dosageRouteController.text.trim(),
        startDate: DateTime.parse(_startDateController.text.trim()),
        prescribingDoctor: _prescribingDoctorController.text.trim(),
      );

      if (!context.mounted) return;
      await context.read<EditMedicationCubit>().editMedication(
        medicationId: widget.medicationId,
        editMedicationRequest: editMedicationRequest,
      );
    } on FormatException {
      if (!context.mounted) return;
      context.showSnackBar(const Text('Invalid date format'));
    }
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
              EditMedicationBlocListener(
                child: EditMedicationFormSection(
                  formKey: _formKey,
                  medicationNameController: _medicationNameController,
                  dosageController: _dosageController,
                  dosageFrequencyController: _dosageFrequencyController,
                  dosageRouteController: _dosageRouteController,
                  startDateController: _startDateController,
                  prescribingDoctorController: _prescribingDoctorController,
                  onSave: () => _handleEditMedication(context),
                ),
              ),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

