part of 'add_medication_cubit.dart';

@immutable
sealed class AddMedicationState {}

final class AddMedicationInitial extends AddMedicationState {}
final class AddMedicationLoading extends AddMedicationState {}
final class AddMedicationFailure extends AddMedicationState {
  AddMedicationFailure({required this.message});

  final String message;

}
final class AddMedicationSuccess extends AddMedicationState {}
