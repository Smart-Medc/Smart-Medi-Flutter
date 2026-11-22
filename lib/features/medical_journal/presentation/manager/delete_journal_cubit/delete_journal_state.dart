part of 'delete_journal_cubit.dart';

sealed class DeleteJournalState {}

final class DeleteJournalInitial extends DeleteJournalState {}

final class DeleteJournalLoading extends DeleteJournalState {}

final class DeleteJournalFailure extends DeleteJournalState {
  DeleteJournalFailure({required this.message});

  final String message;
}

final class DeleteJournalSuccess extends DeleteJournalState {}

