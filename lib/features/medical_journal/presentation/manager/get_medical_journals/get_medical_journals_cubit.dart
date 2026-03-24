import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_journal/data/models/get_journals_models/get_journal_response.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';

part 'get_medical_journals_state.dart';

class GetMedicalJournalsCubit extends Cubit<GetMedicalJournalsState> {
  GetMedicalJournalsCubit(this.medicalJournalRepo)
      : super(GetMedicalJournalsInitial());

  final MedicalJournalRepo medicalJournalRepo;

  Future<void> getMedicalJournalsForCurrentPatient() async {
    emit(GetMedicalJournalsLoading());

    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        GetMedicalJournalsFailure('Patient ID not found. Please login again.'),
      );
      return;
    }


    final result = await medicalJournalRepo.getMedicalJournals(
      patientId: patientId,
    );

    result.fold(
      (failure) => emit(GetMedicalJournalsFailure(failure.message)),
      (response) => emit(GetMedicalJournalsSuccess(response)),
    );
  }
}
