import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/appointment/data/models/get_organization_details_models/get_organization_details_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';

abstract class AppointmentRepo{
  Future<Either<Failure, List<GetOrganizationsResponse>>> getOrganizations();
  Future<Either<Failure, OrganizationDetailsResponse>> getOrganizationDetails({required String organizationId});
}