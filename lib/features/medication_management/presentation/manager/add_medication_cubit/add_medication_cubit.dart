import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/medication_management/data/models/add_medication_model/add_medication_request.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';

part 'add_medication_state.dart';

class AddMedicationCubit extends Cubit<AddMedicationState> {
  AddMedicationCubit(this.medicationManagementRepo) : super(AddMedicationInitial());
  final MedicationManagementRepo medicationManagementRepo;
  Future<void> addMedication({
    required AddMedicationRequest addMedicationRequest,
    required String patientId,
  }) async {
    emit(AddMedicationLoading());
    final result = await medicationManagementRepo.addMedication(
      addMedicationRequest: addMedicationRequest,
      patientId: patientId,
    );
    result.fold(
      (failure) => emit(AddMedicationFailure(message: failure.message)),
      (_) => emit(AddMedicationSuccess()),
    );
  }
}
