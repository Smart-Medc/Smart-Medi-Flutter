import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_model/add_medication_request.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';

class MedicationManagementRepoImpl extends MedicationManagementRepo {
  MedicationManagementRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, Unit>> addMedication({
    required AddMedicationRequest addMedicationRequest,
    required String patientId,
  }) async {
    return ApiHelper.execute<Unit>(() async {
      await apiService.post(
        endpoint: ApiEndpoints.addPatientMedication(patientId: patientId),
        data: addMedicationRequest.toJson(),
      );
      return unit;
    });
  }

  @override
  Future<Either<Failure, GetMedicationResponse>> getMedications({
    required String patientId,
    bool? includeInactive,
  }) async {
    return ApiHelper.execute<GetMedicationResponse>(() async {
      final data = await apiService.get(
        endpoint: ApiEndpoints.getPatientMedications(
          patientId: patientId,
          includeInactive: includeInactive ?? false,
        ),
      );
      return GetMedicationResponse.fromJson(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteMedication({required String patientId, required String medicationId}) {
    return ApiHelper.execute<Unit>(() async {
      await apiService.delete(
        endpoint: ApiEndpoints.deletePatientMedication(
          patientId: patientId,
          medicationId: medicationId,
        ),
      );
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> editMedication({required String patientId, required String medicationId, required AddMedicationRequest editMedicationRequest}) {
    return ApiHelper.execute<Unit>(() async {
      await apiService.put(
        endpoint: ApiEndpoints.editPatientMedication(
          patientId: patientId,
          medicationId: medicationId,
        ),
        data: editMedicationRequest.toJson(),
      );
      return unit;
    });
  }
}
