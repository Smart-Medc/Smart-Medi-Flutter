part of 'revoke_access_cubit.dart';

@immutable
sealed class RevokeAccessState {}

final class RevokeAccessInitial extends RevokeAccessState {}
final class RevokeAccessLoading extends RevokeAccessState {}
final class RevokeAccessSuccess extends RevokeAccessState {}
final class RevokeAccessFailure extends RevokeAccessState {
  RevokeAccessFailure({required this.message});

  final String message;
}
