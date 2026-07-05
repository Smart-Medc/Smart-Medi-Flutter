import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';

part 'delete_medical_record_state.dart';

class DeleteMedicalRecordCubit extends Cubit<DeleteMedicalRecordState> {
  DeleteMedicalRecordCubit(this.medicalRecordsRepo) : super(DeleteMedicalRecordInitial());
  final MedicalRecordsRepo medicalRecordsRepo;

  Future<void> deleteMedicalRecord(String recordId) async {
    emit(DeleteMedicalRecordLoading());
    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        DeleteMedicalRecordFailure(message: 'Patient ID not found. Please login again.'),
      );
      return;
    }
    final result =  await medicalRecordsRepo.deleteMedicalRecord(patientId: patientId, recordId: recordId);
    result.fold(
          (failure) => emit(DeleteMedicalRecordFailure(message: failure.message)),
          (_) => emit(DeleteMedicalRecordSuccess()),
    );
  }
}
