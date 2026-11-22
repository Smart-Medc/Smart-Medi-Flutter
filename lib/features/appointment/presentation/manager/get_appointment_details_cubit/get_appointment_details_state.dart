part of 'get_appointment_details_cubit.dart';

@immutable
sealed class GetAppointmentDetailsState {}

final class GetAppointmentDetailsInitial extends GetAppointmentDetailsState {}
final class GetAppointmentDetailsLoading extends GetAppointmentDetailsState {}
final class GetAppointmentDetailsSuccess extends GetAppointmentDetailsState {
  GetAppointmentDetailsSuccess({required this.appointmentDetailsResponse});
  final GetAppointmentDetailsResponse appointmentDetailsResponse;
}
final class GetAppointmentDetailsFailure extends GetAppointmentDetailsState {
  GetAppointmentDetailsFailure({required this.message});
  final String message;
}
