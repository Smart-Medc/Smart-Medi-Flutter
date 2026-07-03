part of 'get_availability_days_cubit.dart';

@immutable
sealed class GetAvailabilityDaysState {}

final class GetAvailabilityDaysInitial extends GetAvailabilityDaysState {}
final class GetAvailabilityDaysLoading extends GetAvailabilityDaysState {}
final class GetAvailabilityDaysSuccess extends GetAvailabilityDaysState {

  GetAvailabilityDaysSuccess({required this.availabilityDays});
  final List<GetAvailabilityDaysResponse> availabilityDays;
}
final class GetAvailabilityDaysFailure extends GetAvailabilityDaysState {
  GetAvailabilityDaysFailure({required this.message});

  final String message;
}
