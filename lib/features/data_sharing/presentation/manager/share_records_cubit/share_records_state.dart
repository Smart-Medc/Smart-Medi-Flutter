part of 'share_records_cubit.dart';

@immutable
sealed class ShareRecordsState {}

final class ShareRecordsInitial extends ShareRecordsState {}
final class ShareRecordsLoading extends ShareRecordsState {}
final class ShareRecordsSuccess extends ShareRecordsState {
  ShareRecordsSuccess({required this.sharedRecord});

  final SharedRecordModel sharedRecord;
}
final class ShareRecordsFailure extends ShareRecordsState {
  ShareRecordsFailure({required this.message});

  final String message;
}
