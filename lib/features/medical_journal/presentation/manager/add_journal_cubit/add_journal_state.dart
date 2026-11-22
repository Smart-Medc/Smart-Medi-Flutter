part of 'add_journal_cubit.dart';

@immutable
sealed class AddJournalState {}

final class AddJournalInitial extends AddJournalState {}
final class AddJournalLoading extends AddJournalState {}
final class AddJournalFailure extends AddJournalState {
  AddJournalFailure({required this.errorMessage});
  final String errorMessage;
}
final class AddJournalSuccess extends AddJournalState {}
