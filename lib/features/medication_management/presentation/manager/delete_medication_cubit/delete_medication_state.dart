part of 'delete_medication_cubit.dart';

sealed class DeleteMedicationState {}

final class DeleteMedicationInitial extends DeleteMedicationState {}
final class DeleteMedicationLoading extends DeleteMedicationState {}
final class DeleteMedicationFailure extends DeleteMedicationState {
  DeleteMedicationFailure({required this.message});

  final String message;
}
final class DeleteMedicationSuccess extends DeleteMedicationState {}
