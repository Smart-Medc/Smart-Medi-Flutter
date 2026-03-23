part of 'get_medical_journals_cubit.dart';

@immutable
sealed class GetMedicalJournalsState {}

final class GetMedicalJournalsInitial extends GetMedicalJournalsState {}
final class GetMedicalJournalsLoading extends GetMedicalJournalsState {}
final class GetMedicalJournalsFailure extends GetMedicalJournalsState {
  GetMedicalJournalsFailure(this.errorMessage);
  final String errorMessage;
}
final class GetMedicalJournalsSuccess extends GetMedicalJournalsState {
  GetMedicalJournalsSuccess(this.getJournalResponse);
  final GetJournalResponse getJournalResponse;
}
