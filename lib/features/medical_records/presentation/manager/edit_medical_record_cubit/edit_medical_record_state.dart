part of 'edit_medical_record_cubit.dart';

@immutable
sealed class EditMedicalRecordState {}

final class EditMedicalRecordInitial extends EditMedicalRecordState {}
final class EditMedicalRecordLoading extends EditMedicalRecordState {}
final class EditMedicalRecordSuccess extends EditMedicalRecordState {}
final class EditMedicalRecordFailure extends EditMedicalRecordState {
  EditMedicalRecordFailure({required this.message});

  final String message;
}
