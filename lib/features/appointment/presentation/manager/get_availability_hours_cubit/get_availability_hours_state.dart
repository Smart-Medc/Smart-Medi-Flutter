part of 'get_availability_hours_cubit.dart';

@immutable
sealed class GetAvailabilityHoursState {}

final class GetAvailabilityHoursInitial extends GetAvailabilityHoursState {}
final class GetAvailabilityHoursLoading extends GetAvailabilityHoursState {}
final class GetAvailabilityHoursSuccess extends GetAvailabilityHoursState {

  GetAvailabilityHoursSuccess({required this.availabilityHours});
  final List<GetAvailabilityHoursResponse> availabilityHours;
}
final class GetAvailabilityHoursFailure extends GetAvailabilityHoursState {
  GetAvailabilityHoursFailure({required this.message});

  final String message;
}
