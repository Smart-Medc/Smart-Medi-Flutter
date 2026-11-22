// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_medi/core/helpers/extensions.dart';
// import 'package:smart_medi/core/widgets/action_buttons.dart';
// import 'package:smart_medi/features/medication_management/data/models/add_medication_request.dart';
// import 'package:smart_medi/features/medication_management/presentation/manager/add_medication_cubit/add_medication_cubit.dart';
//
// class AddMedicationActionButtons extends StatelessWidget {
//   const AddMedicationActionButtons({
//     super.key,
//     required this.medicationNameController,
//     required this.dosageController,
//     required this.dosageFrequencyController,
//     required this.dosageRouteController,
//     required this.startDateController,
//     required this.prescribingDoctorController,
//   });
//
//   final TextEditingController medicationNameController;
//   final TextEditingController dosageController;
//   final TextEditingController dosageFrequencyController;
//   final TextEditingController dosageRouteController;
//   final TextEditingController startDateController;
//   final TextEditingController prescribingDoctorController;
//
//   bool _validateFields(BuildContext context) {
//     if (medicationNameController.text.isEmpty) {
//       context.showSnackBar(const Text('Please enter medication name'));
//       return false;
//     }
//     if (dosageController.text.isEmpty) {
//       context.showSnackBar(const Text('Please enter dosage'));
//       return false;
//     }
//     if (dosageFrequencyController.text.isEmpty) {
//       context.showSnackBar(const Text('Please enter dosage frequency'));
//       return false;
//     }
//     if (dosageRouteController.text.isEmpty) {
//       context.showSnackBar(const Text('Please enter dosage route'));
//       return false;
//     }
//     if (startDateController.text.isEmpty) {
//       context.showSnackBar(const Text('Please select start date'));
//       return false;
//     }
//     if (prescribingDoctorController.text.isEmpty) {
//       context.showSnackBar(const Text('Please enter prescribing doctor'));
//       return false;
//     }
//     return true;
//   }
//
//   void _handleAddMedication(BuildContext context) {
//     // Validate form fields
//     if (!_validateFields(context)) {
//       return;
//     }
//
//     try {
//       final startDate = DateTime.parse(startDateController.text);
//       final addMedicationRequest = AddMedicationRequest(
//         name: medicationNameController.text,
//         dosage: dosageController.text,
//         frequency: dosageFrequencyController.text,
//         route: dosageRouteController.text,
//         instructions: '',
//         startDate: startDate,
//         endDate: null,
//         prescribingDoctor: prescribingDoctorController.text,
//       );
//
//       context.read<AddMedicationCubit>().addMedication(
//             addMedicationRequest: addMedicationRequest,
//             patientId: '', // Get patientId from your state management
//           );
//     } catch (e) {
//       context.showSnackBar(const Text('Invalid date format. Use yyyy-MM-dd'));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ActionButtons(
//       primaryButtonText: 'Add Medication',
//       onPrimaryPressed: () {
//         _handleAddMedication(context);
//       },
//     );
//   }
// }
//
