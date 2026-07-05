import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/medical_records/data/models/add_medical_record_models/add_medical_record_request.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_record_details_models/get_medical_record_details_response.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_models/get_medical_records_response.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_statistics/get_medical_records_statistics_response.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';

class MedicalRecordsRepoImpl extends MedicalRecordsRepo {
  MedicalRecordsRepoImpl({required this.apiService});

  final ApiService apiService;
  @override
  Future<Either<Failure, GetMedicalRecordsResponse>> getMedicalRecords({required String patientId}) {
    return ApiHelper.execute<GetMedicalRecordsResponse>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getMedicalRecords(patientId: patientId),
      );
      return GetMedicalRecordsResponse.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, GetMedicalRecordDetailsResponse>> getMedicalRecordDetails({required String patientId, required String recordId}) {
    return ApiHelper.execute<GetMedicalRecordDetailsResponse>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getMedicalRecordDetails(patientId: patientId, recordId: recordId),
      );
      return GetMedicalRecordDetailsResponse.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteMedicalRecord({required String patientId, required String recordId}) {
    return ApiHelper.execute<Unit>(() async {
      await apiService.delete(
        endpoint: ApiEndpoints.deleteMedicalRecord(patientId: patientId, recordId: recordId),
      );
      return unit;
    });
  }

  @override
  Future<Either<Failure, GetMedicalRecordsStatisticsResponse>> getMedicalRecordsStatistics({required String patientId}) {
    return ApiHelper.execute<GetMedicalRecordsStatisticsResponse>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getMedicalRecordsStatistics(patientId: patientId),
      );
      return GetMedicalRecordsStatisticsResponse.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, Unit>> addMedicalRecord({required AddMedicalRecordRequest addMedicalRecordRequest, required String patientId}) {
    return ApiHelper.execute<Unit>(() async {
      await apiService.post(
        endpoint: ApiEndpoints.addMedicalRecord(patientId: patientId),
        data: addMedicalRecordRequest.toJson(),
      );
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> editMedicalRecord({required AddMedicalRecordRequest addMedicalRecordRequest, required String patientId, required String recordId}) {
    return ApiHelper.execute<Unit>(() async {
      await apiService.put(
        endpoint: ApiEndpoints.editMedicalRecord(patientId: patientId, recordId: recordId),
        data: addMedicalRecordRequest.toJson(),
      );
      return unit;
    });
  }
}