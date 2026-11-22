import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/add_medication_cubit/add_medication_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/add_medication_widgets/add_medication_form_fields.dart';

class AddMedicationBlocListener extends StatelessWidget {
  const AddMedicationBlocListener({
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
    return BlocListener<AddMedicationCubit, AddMedicationState>(
      listener: (context, state) {
        if (state is AddMedicationLoading) {
          showLoadingDialog(context, message: 'Adding medication...');
        } else if (state is AddMedicationSuccess) {
          GoRouter.of(context).pop();
          context.showSnackBar(const Text('Medication added successfully'));
          // Navigate back to refresh medications list
          GoRouter.of(context).pop();
        } else if (state is AddMedicationFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text('Failed to add medication: ${state.message}'));
        }
      },
      child: AddMedicationFormFields(
        medicationNameController: medicationNameController,
        dosageController: dosageController,
        dosageFrequencyController: dosageFrequencyController,
        dosageRouteController: dosageRouteController,
        startDateController: startDateController,
        prescribingDoctorController: prescribingDoctorController,
      ),
    );
  }
}

