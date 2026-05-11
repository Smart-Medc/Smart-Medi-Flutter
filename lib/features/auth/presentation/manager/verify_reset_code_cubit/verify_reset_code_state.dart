part of 'verify_reset_code_cubit.dart';

@immutable
sealed class VerifyResetCodeState {}

final class VerifyResetCodeInitial extends VerifyResetCodeState {}
final class VerifyResetCodeLoading extends VerifyResetCodeState {}
final class VerifyResetCodeSuccess extends VerifyResetCodeState {
  VerifyResetCodeSuccess({required this.code});

  final String code;
}
final class VerifyResetCodeFailure extends VerifyResetCodeState {
  VerifyResetCodeFailure({required this.message});

  final String message;
}

// Resend reset code states
final class ResendResetCodeLoading extends VerifyResetCodeState {}
final class ResendResetCodeSuccess extends VerifyResetCodeState {}
final class ResendResetCodeFailure extends VerifyResetCodeState {
  ResendResetCodeFailure({required this.message});

  final String message;
}

