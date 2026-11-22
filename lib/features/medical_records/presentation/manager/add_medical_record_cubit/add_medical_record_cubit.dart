import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_records/data/models/add_medical_record_models/add_medical_record_request.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';

part 'add_medical_record_state.dart';

class AddMedicalRecordCubit extends Cubit<AddMedicalRecordState> {
  AddMedicalRecordCubit(this.medicalRecordsRepo) : super(AddMedicalRecordInitial());
  final MedicalRecordsRepo medicalRecordsRepo;
  Future<void> addMedicalRecord({required AddMedicalRecordRequest addMedicalRecordRequest}) async {
    emit(AddMedicalRecordLoading());
    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        AddMedicalRecordFailure(message: 'Patient ID not found. Please login again.'),
      );
      return;
    }
    final result = await medicalRecordsRepo.addMedicalRecord(addMedicalRecordRequest: addMedicalRecordRequest, patientId: patientId);
    result.fold(
      (failure) => emit(AddMedicalRecordFailure(message: failure.message)),
      (_) => emit(AddMedicalRecordSuccess()),
    );
  }
}
