import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_journal/data/models/add_journal_models/add_journal_request.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';

part 'edit_journal_state.dart';

class EditJournalCubit extends Cubit<EditJournalState> {
  EditJournalCubit(this.medicalJournalRepo) : super(EditJournalInitial());

  final MedicalJournalRepo medicalJournalRepo;

  Future<void> editJournalEntry({
	required String journalId,
	required AddJournalRequest editJournalRequest,
  }) async {
	if (journalId.trim().isEmpty) {
	  emit(EditJournalFailure(errorMessage: 'Journal ID is required'));
	  return;
	}

	if (editJournalRequest.title.trim().isEmpty) {
	  emit(EditJournalFailure(errorMessage: 'Journal title is required'));
	  return;
	}

	final patientId = await SecureStorageHelper.getPatientId();
	if (patientId == null || patientId.trim().isEmpty) {
	  emit(
		EditJournalFailure(
		  errorMessage: 'Patient ID not found. Please login again.',
		),
	  );
	  return;
	}

	emit(EditJournalLoading());

	final result = await medicalJournalRepo.editJournalEntry(
	  patientId: patientId,
	  journalId: journalId,
	  editJournalRequest: editJournalRequest,
	);

	result.fold(
	  (failure) => emit(EditJournalFailure(errorMessage: failure.message)),
	  (_) => emit(EditJournalSuccess()),
	);
  }
}