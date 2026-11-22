part of 'add_medical_record_cubit.dart';

@immutable
sealed class AddMedicalRecordState {}

final class AddMedicalRecordInitial extends AddMedicalRecordState {}
final class AddMedicalRecordLoading extends AddMedicalRecordState {}
final class AddMedicalRecordSuccess extends AddMedicalRecordState {}
final class AddMedicalRecordFailure extends AddMedicalRecordState {
  AddMedicalRecordFailure({required this.message});

  final String message;
}
