import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_journal/data/models/add_journal_models/add_journal_request.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';

part 'add_journal_state.dart';

class AddJournalCubit extends Cubit<AddJournalState> {
  AddJournalCubit(this.medicalJournalRepo) : super(AddJournalInitial());
  final MedicalJournalRepo medicalJournalRepo;

  Future<void> addJournalEntry({
    required AddJournalRequest addJournalRequest,
  }) async {
    if (addJournalRequest.title.trim().isEmpty) {
      emit(AddJournalFailure(errorMessage: 'Journal title is required'));
      return;
    }

    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        AddJournalFailure(
          errorMessage: 'Patient ID not found. Please login again.',
        ),
      );
      return;
    }

    emit(AddJournalLoading());

    final result = await medicalJournalRepo.addJournalEntry(
      patientId: patientId,
      addJournalRequest: addJournalRequest,
    );

    result.fold(
      (failure) => emit(AddJournalFailure(errorMessage: failure.message)),
      (_) => emit(AddJournalSuccess()),
    );
  }
}
