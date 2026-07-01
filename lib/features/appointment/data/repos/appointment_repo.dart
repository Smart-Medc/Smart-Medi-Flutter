import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointment_details_models/get_appointment_details_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_organization_details_models/get_organization_details_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';

abstract class AppointmentRepo{
  Future<Either<Failure, List<GetOrganizationsResponse>>> getOrganizations();
  Future<Either<Failure, OrganizationDetailsResponse>> getOrganizationDetails({required String organizationId});
  Future<Either<Failure, GetAppointmentsResponse>> getPatientAppointments({required String patientId});
  Future<Either<Failure, GetAppointmentDetailsResponse>> getPatientAppointmentDetails({required String appointmentId});
}