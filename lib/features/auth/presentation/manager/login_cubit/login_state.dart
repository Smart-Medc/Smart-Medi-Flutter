part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginFailure extends LoginState {
  LoginFailure({required this.message});

  final String message;
}
final class LoginSuccess extends LoginState {
  LoginSuccess({required this.loginResponse});

  final LoginResponse loginResponse;
}
