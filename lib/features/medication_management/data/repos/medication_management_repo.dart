import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_model/add_medication_request.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';

abstract class MedicationManagementRepo {
  Future<Either<Failure, Unit>> addMedication({
    required AddMedicationRequest addMedicationRequest,
    required String patientId,
  });
  Future<Either<Failure, GetMedicationResponse>> getMedications({
    required String patientId,
    bool? includeInactive,
  });
  Future<Either<Failure, Unit>> deleteMedication({
    required String patientId,
    required String medicationId,
  });
  Future<Either<Failure, Unit>> editMedication({
    required String patientId,
    required String medicationId,
    required AddMedicationRequest editMedicationRequest,
  });
}
