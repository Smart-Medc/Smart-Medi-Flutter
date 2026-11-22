import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_model/add_medication_request.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';

part 'edit_medication_state.dart';

class EditMedicationCubit extends Cubit<EditMedicationState> {
  EditMedicationCubit(this.medicationManagementRepo)
      : super(EditMedicationInitial());

  final MedicationManagementRepo medicationManagementRepo;

  Future<void> editMedication({
    required String medicationId,
    required AddMedicationRequest editMedicationRequest,
  }) async {
    if (medicationId.trim().isEmpty) {
      emit(EditMedicationFailure(message: 'Medication ID is required'));
      return;
    }

    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        EditMedicationFailure(
          message: 'Patient ID not found. Please login again.',
        ),
      );
      return;
    }

    emit(EditMedicationLoading());

    final result = await medicationManagementRepo.editMedication(
      patientId: patientId,
      medicationId: medicationId,
      editMedicationRequest: editMedicationRequest,
    );

    result.fold(
      (failure) => emit(EditMedicationFailure(message: failure.message)),
      (_) => emit(EditMedicationSuccess()),
    );
  }
}
