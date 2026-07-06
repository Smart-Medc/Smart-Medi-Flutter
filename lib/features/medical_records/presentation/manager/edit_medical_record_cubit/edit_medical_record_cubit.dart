import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_records/data/models/add_medical_record_models/add_medical_record_request.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';

part 'edit_medical_record_state.dart';

class EditMedicalRecordCubit extends Cubit<EditMedicalRecordState> {
  EditMedicalRecordCubit(this.medicalRecordsRepo) : super(EditMedicalRecordInitial());
  final MedicalRecordsRepo medicalRecordsRepo;
  Future<void> editMedicalRecord({required AddMedicalRecordRequest addMedicalRecordRequest,required String recordId}) async {
    emit(EditMedicalRecordLoading());
    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        EditMedicalRecordFailure(message: 'Patient ID not found. Please login again.'),
      );
      return;
    }
    final result = await medicalRecordsRepo.editMedicalRecord(addMedicalRecordRequest: addMedicalRecordRequest, patientId: patientId, recordId: recordId);
    result.fold(
      (failure) => emit(EditMedicalRecordFailure(message: failure.message)),
      (_) => emit(EditMedicalRecordSuccess()),
    );
  }
}
