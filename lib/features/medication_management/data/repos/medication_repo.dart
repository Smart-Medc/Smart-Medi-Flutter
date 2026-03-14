import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_request.dart';

abstract class MedicationRepo {
  Future<Either<Failure, Unit>> addMedication({
    required AddMedicationRequest addMedicationRequest,
    required String patientId,
  });
}
