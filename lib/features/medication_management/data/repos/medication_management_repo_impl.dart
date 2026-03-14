import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_request.dart';
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
}
