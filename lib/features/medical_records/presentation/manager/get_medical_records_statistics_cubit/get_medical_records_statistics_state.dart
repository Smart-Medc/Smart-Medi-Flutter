part of 'get_medical_records_statistics_cubit.dart';

@immutable
sealed class GetMedicalRecordsStatisticsState {}

final class GetMedicalRecordsStatisticsInitial extends GetMedicalRecordsStatisticsState {}
final class GetMedicalRecordsStatisticsLoading extends GetMedicalRecordsStatisticsState {}
final class GetMedicalRecordsStatisticsSuccess extends GetMedicalRecordsStatisticsState {
  GetMedicalRecordsStatisticsSuccess({required this.statistics});

  final GetMedicalRecordsStatisticsResponse statistics;
}
final class GetMedicalRecordsStatisticsFailure extends GetMedicalRecordsStatisticsState {
  GetMedicalRecordsStatisticsFailure({required this.message});

  final String message;
}
