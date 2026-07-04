import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
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
}