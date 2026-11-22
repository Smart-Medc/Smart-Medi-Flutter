part of 'delete_medical_record_cubit.dart';

@immutable
sealed class DeleteMedicalRecordState {}

final class DeleteMedicalRecordInitial extends DeleteMedicalRecordState {}
final class DeleteMedicalRecordLoading extends DeleteMedicalRecordState {}
final class DeleteMedicalRecordSuccess extends DeleteMedicalRecordState {}
final class DeleteMedicalRecordFailure extends DeleteMedicalRecordState {
  DeleteMedicalRecordFailure({required this.message});

  final String message;
}
