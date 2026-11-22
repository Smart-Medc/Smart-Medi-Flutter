import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/appointment/data/models/cancel_appointment_models/cancel_appointment_request.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointment_details_models/get_appointment_details_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_days/get_availability_days_request.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_days/get_availability_days_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_hours_models/get_availability_hours_request.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_hours_models/get_availability_hours_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_organization_details_models/get_organization_details_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/data/models/post_appointment_models/post_appointment_request.dart';
import 'package:smart_medi/features/appointment/data/models/post_appointment_models/post_appointment_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

class AppointmentRepoImpl extends AppointmentRepo{
  AppointmentRepoImpl({required this.apiService});
  final ApiService apiService;
  @override
  Future<Either<Failure, List<GetOrganizationsResponse>>> getOrganizations() {
    return ApiHelper.execute<List<GetOrganizationsResponse>>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getOrganizations(),
      );
      return (response['items'] as List)
          .map((e) => GetOrganizationsResponse.fromJson(e))
          .toList();
    });
  }

  @override
  Future<Either<Failure, OrganizationDetailsResponse>> getOrganizationDetails({required String organizationId}) {
    return ApiHelper.execute<OrganizationDetailsResponse>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getOrganizationDetails(organizationId: organizationId),
      );
      return OrganizationDetailsResponse.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, GetAppointmentsResponse>> getPatientAppointments({required String patientId}) {
    return ApiHelper.execute<GetAppointmentsResponse>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getPatientAppointments(patientId: patientId),
      );
      return GetAppointmentsResponse.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, GetAppointmentDetailsResponse>> getPatientAppointmentDetails({required String appointmentId}) {
    return ApiHelper.execute<GetAppointmentDetailsResponse>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getPatientAppointmentDetails(appointmentId: appointmentId),
      );
      return GetAppointmentDetailsResponse.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, List<GetAvailabilityDaysResponse>>> getAvailabilityDays({required GetAvailabilityDaysRequest request}) {
    return ApiHelper.execute<List<GetAvailabilityDaysResponse>>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getAvailabilityDays(organizationId: request.organizationId),
        queryParameters: request.toQueryParameters(),
      );
      return (response as List)
          .map((e) => GetAvailabilityDaysResponse.fromJson(e))
          .toList();
    });
  }

  @override
  Future<Either<Failure, List<GetAvailabilityHoursResponse>>> getAvailabilityHours({required GetAvailabilityHoursRequest request}) {
    return ApiHelper.execute<List<GetAvailabilityHoursResponse>>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getAvailabilityHours(organizationId: request.organizationId),
        queryParameters: request.toQueryParameters(),
      );
      return (response as List)
          .map((e) => GetAvailabilityHoursResponse.fromJson(e))
          .toList();
    });
  }

  @override
  Future<Either<Failure, PostAppointmentResponse>> postAppointment({required PostAppointmentRequest postAppointmentRequest}) {
    return ApiHelper.execute<PostAppointmentResponse>(() async {
      final response = await apiService.post(
        endpoint: ApiEndpoints.postAppointment(),
        data: postAppointmentRequest.toJson(),
      );
      return PostAppointmentResponse.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, Unit>> cancelAppointment({required CancelAppointmentRequest request}) {
    return ApiHelper.execute<Unit>(() async {
      await apiService.put(
        endpoint: ApiEndpoints.cancelAppointment(appointmentId: request.appointmentId),
        data: request.toJson(),
      );
      return unit;
    });
  }

}