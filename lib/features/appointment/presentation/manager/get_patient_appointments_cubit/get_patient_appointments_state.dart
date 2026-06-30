part of 'get_patient_appointments_cubit.dart';

@immutable
sealed class GetPatientAppointmentsState {}

final class GetPatientAppointmentsInitial extends GetPatientAppointmentsState {}
final class GetPatientAppointmentsLoading extends GetPatientAppointmentsState {}
final class GetPatientAppointmentsSuccess extends GetPatientAppointmentsState {
  GetPatientAppointmentsSuccess({required this.appointmentsResponse});
  final GetAppointmentsResponse appointmentsResponse;
}
final class GetPatientAppointmentsFailure extends GetPatientAppointmentsState {
  GetPatientAppointmentsFailure({required this.message});
  final String message;
}
