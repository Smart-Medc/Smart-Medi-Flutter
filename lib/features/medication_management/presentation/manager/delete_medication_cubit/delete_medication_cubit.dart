import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';

part 'delete_medication_state.dart';

class DeleteMedicationCubit extends Cubit<DeleteMedicationState> {
  DeleteMedicationCubit(this.medicationManagementRepo)
      : super(DeleteMedicationInitial());

  final MedicationManagementRepo medicationManagementRepo;

  Future<void> deleteMedication({
    required String medicationId,
  }) async {
    if (medicationId.trim().isEmpty) {
      emit(DeleteMedicationFailure(message: 'Medication ID is required'));
      return;
    }

    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        DeleteMedicationFailure(
          message: 'Patient ID not found. Please login again.',
        ),
      );
      return;
    }

    emit(DeleteMedicationLoading());

    final result = await medicationManagementRepo.deleteMedication(
      patientId: patientId,
      medicationId: medicationId,
    );

    result.fold(
      (failure) => emit(DeleteMedicationFailure(message: failure.message)),
      (_) => emit(DeleteMedicationSuccess()),
    );
  }
}
