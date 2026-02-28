part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordFailure extends ForgetPasswordState {
  ForgetPasswordFailure({required this.message});

  final String message;
}
final class ForgetPasswordSuccess extends ForgetPasswordState {
  ForgetPasswordSuccess({required this.email});

  final String email;
}
