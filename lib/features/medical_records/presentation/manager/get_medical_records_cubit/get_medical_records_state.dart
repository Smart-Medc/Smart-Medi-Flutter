part of 'get_medical_records_cubit.dart';

@immutable
sealed class GetMedicalRecordsState {}

final class GetMedicalRecordsInitial extends GetMedicalRecordsState {}
final class GetMedicalRecordsLoading extends GetMedicalRecordsState {}
final class GetMedicalRecordsSuccess extends GetMedicalRecordsState {
  GetMedicalRecordsSuccess({required this.medicalRecordsResponse, required this.patientId});

  final GetMedicalRecordsResponse medicalRecordsResponse;
  final String patientId;
}
final class GetMedicalRecordsFailure extends GetMedicalRecordsState {
  GetMedicalRecordsFailure({required this.message});

  final String message;
}
