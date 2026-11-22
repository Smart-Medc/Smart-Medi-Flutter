part of 'edit_medication_cubit.dart';

@immutable
sealed class EditMedicationState {}

final class EditMedicationInitial extends EditMedicationState {}
final class EditMedicationLoading extends EditMedicationState {}
final class EditMedicationFailure extends EditMedicationState {
  EditMedicationFailure({required this.message});

  final String message;
}
final class EditMedicationSuccess extends EditMedicationState {}
