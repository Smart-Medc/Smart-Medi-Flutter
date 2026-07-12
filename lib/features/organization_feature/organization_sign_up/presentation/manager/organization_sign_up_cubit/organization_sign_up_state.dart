part of 'organization_sign_up_cubit.dart';

@immutable
sealed class OrganizationSignUpState {}

final class OrganizationSignUpInitial extends OrganizationSignUpState {}
final class OrganizationSignUpLoading extends OrganizationSignUpState {}
final class OrganizationSignUpFailure extends OrganizationSignUpState {
  OrganizationSignUpFailure({required this.message});

  final String message;
}
final class OrganizationSignUpSuccess extends OrganizationSignUpState {}
