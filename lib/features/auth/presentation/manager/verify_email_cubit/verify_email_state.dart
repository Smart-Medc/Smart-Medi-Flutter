part of 'verify_email_cubit.dart';

@immutable
sealed class VerifyEmailState {}

final class VerifyEmailInitial extends VerifyEmailState {}
final class VerifyEmailLoading extends VerifyEmailState {}
final class VerifyEmailFailure extends VerifyEmailState {
  VerifyEmailFailure({required this.message});

  final String message;
}
final class VerifyEmailSuccess extends VerifyEmailState {
  VerifyEmailSuccess({required this.loginResponse});

  final LoginResponse loginResponse;
}
