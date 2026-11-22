import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
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

abstract class AppointmentRepo{
  Future<Either<Failure, List<GetOrganizationsResponse>>> getOrganizations();
  Future<Either<Failure, OrganizationDetailsResponse>> getOrganizationDetails({required String organizationId});
  Future<Either<Failure, GetAppointmentsResponse>> getPatientAppointments({required String patientId});
  Future<Either<Failure, GetAppointmentDetailsResponse>> getPatientAppointmentDetails({required String appointmentId});
  Future<Either<Failure, List<GetAvailabilityDaysResponse>>> getAvailabilityDays({required GetAvailabilityDaysRequest request});
  Future<Either<Failure, List<GetAvailabilityHoursResponse>>> getAvailabilityHours({required GetAvailabilityHoursRequest request});
  Future<Either<Failure, PostAppointmentResponse>> postAppointment({required PostAppointmentRequest postAppointmentRequest});
  Future<Either<Failure, Unit>> cancelAppointment({required CancelAppointmentRequest request});
}