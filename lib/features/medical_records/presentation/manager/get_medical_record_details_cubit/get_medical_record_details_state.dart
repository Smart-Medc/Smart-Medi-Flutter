part of 'get_medical_record_details_cubit.dart';

@immutable
sealed class GetMedicalRecordDetailsState {}

final class GetMedicalRecordDetailsInitial extends GetMedicalRecordDetailsState {}
final class GetMedicalRecordDetailsLoading extends GetMedicalRecordDetailsState {}
final class GetMedicalRecordDetailsSuccess extends GetMedicalRecordDetailsState {
  GetMedicalRecordDetailsSuccess({required this.medicalRecordDetailsResponse});
  final GetMedicalRecordDetailsResponse medicalRecordDetailsResponse;
}
final class GetMedicalRecordDetailsFailure extends GetMedicalRecordDetailsState {
  GetMedicalRecordDetailsFailure({required this.message});

  final String message;
}
