import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';

part 'delete_journal_state.dart';

class DeleteJournalCubit extends Cubit<DeleteJournalState> {
  DeleteJournalCubit(this.medicalJournalRepo) : super(DeleteJournalInitial());

  final MedicalJournalRepo medicalJournalRepo;

  Future<void> deleteJournal({
    required String journalId,
  }) async {
    if (journalId.trim().isEmpty) {
      emit(DeleteJournalFailure(message: 'Journal ID is required'));
      return;
    }

    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        DeleteJournalFailure(
          message: 'Patient ID not found. Please login again.',
        ),
      );
      return;
    }

    emit(DeleteJournalLoading());

    final result = await medicalJournalRepo.deleteJournalEntry(
      patientId: patientId,
      journalId: journalId,
    );

    result.fold(
      (failure) => emit(DeleteJournalFailure(message: failure.message)),
      (_) => emit(DeleteJournalSuccess()),
    );
  }
}

