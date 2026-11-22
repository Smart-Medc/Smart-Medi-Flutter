part of 'edit_journal_cubit.dart';

@immutable
sealed class EditJournalState {}

final class EditJournalInitial extends EditJournalState {}

final class EditJournalLoading extends EditJournalState {}

final class EditJournalFailure extends EditJournalState {
  EditJournalFailure({required this.errorMessage});

  final String errorMessage;
}

final class EditJournalSuccess extends EditJournalState {}