import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';

part 'get_medications_state.dart';

class GetMedicationsCubit extends Cubit<GetMedicationsState> {
  GetMedicationsCubit(this.medicationManagementRepo) : super(GetMedicationsInitial());
  final MedicationManagementRepo medicationManagementRepo;

  Future<void> getMedications({required String patientId}) async {
    emit(GetMedicationsLoading());
    final result = await medicationManagementRepo.getMedications(patientId: patientId);
    result.fold((failure) {
      emit(GetMedicationsFailure(failure.message));
    }, (medications) {
      emit(GetMedicationsSuccess(medications));
    });
  }

}
