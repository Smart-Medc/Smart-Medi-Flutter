part of 'get_organization_details_cubit.dart';

@immutable
sealed class GetOrganizationDetailsState {}

final class GetOrganizationDetailsInitial extends GetOrganizationDetailsState {}
final class GetOrganizationDetailsLoading extends GetOrganizationDetailsState {}
final class GetOrganizationDetailsSuccess extends GetOrganizationDetailsState {
  GetOrganizationDetailsSuccess({required this.organizationDetailsResponse});

  final OrganizationDetailsResponse organizationDetailsResponse;
}
final class GetOrganizationDetailsFailure extends GetOrganizationDetailsState {
  GetOrganizationDetailsFailure({required this.message});

  final String message;
}
