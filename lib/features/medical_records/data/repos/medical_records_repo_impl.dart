import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_record_details_models/get_medical_record_details_response.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_models/get_medical_records_response.dart';
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
}