part of 'get_shared_records_cubit.dart';

@immutable
sealed class GetSharedRecordsState {}

final class GetSharedRecordsInitial extends GetSharedRecordsState {}
final class GetSharedRecordsLoading extends GetSharedRecordsState {}
final class GetSharedRecordsSuccess extends GetSharedRecordsState {
  GetSharedRecordsSuccess({required this.getSharedRecordsResponse});
  final GetSharedRecordsResponse getSharedRecordsResponse;
}
final class GetSharedRecordsFailure extends GetSharedRecordsState {
  GetSharedRecordsFailure({required this.message});

  final String message;
}
