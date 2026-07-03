part of 'post_appointment_cubit.dart';

@immutable
sealed class PostAppointmentState {}

final class PostAppointmentInitial extends PostAppointmentState {}
final class PostAppointmentLoading extends PostAppointmentState {}
final class PostAppointmentSuccess extends PostAppointmentState {
  PostAppointmentSuccess({required this.postAppointmentResponse});

  final PostAppointmentResponse postAppointmentResponse;
}
final class PostAppointmentFailure extends PostAppointmentState {
  PostAppointmentFailure({required this.message});

  final String message;
}
