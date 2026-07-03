part of 'cancel_appointment_cubit.dart';

@immutable
sealed class CancelAppointmentState {}

final class CancelAppointmentInitial extends CancelAppointmentState {}
final class CancelAppointmentLoading extends CancelAppointmentState {}
final class CancelAppointmentSuccess extends CancelAppointmentState {}
final class CancelAppointmentFailure extends CancelAppointmentState {
  CancelAppointmentFailure({required this.message});

  final String message;
}
