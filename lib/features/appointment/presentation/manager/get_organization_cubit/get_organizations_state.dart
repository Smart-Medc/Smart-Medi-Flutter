part of 'get_organizations_cubit.dart';

@immutable
sealed class GetOrganizationsState {}

final class GetOrganizationsInitial extends GetOrganizationsState {}
final class GetOrganizationsLoading extends GetOrganizationsState {}
final class GetOrganizationsSuccess extends GetOrganizationsState {
  GetOrganizationsSuccess({required this.organizations});

  final List<GetOrganizationsResponse> organizations;
}
final class GetOrganizationsFailure extends GetOrganizationsState {
  GetOrganizationsFailure({required this.message});

  final String message;
}
