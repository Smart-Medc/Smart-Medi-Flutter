import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_models/get_medical_records_response.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';

part 'get_medical_records_state.dart';

class GetMedicalRecordsCubit extends Cubit<GetMedicalRecordsState> {
  GetMedicalRecordsCubit(this.medicalRecordsRepo) : super(GetMedicalRecordsInitial());
  final MedicalRecordsRepo medicalRecordsRepo;

  Future<void> getMedicalRecords() async {
    emit(GetMedicalRecordsLoading());
    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        GetMedicalRecordsFailure(message: 'Patient ID not found. Please login again.'),
      );
      return;
    }
    final result = await medicalRecordsRepo.getMedicalRecords(patientId: patientId);
    result.fold(
      (failure) => emit(GetMedicalRecordsFailure(message: failure.message)),
      (response) => emit(GetMedicalRecordsSuccess(medicalRecordsResponse: response, patientId: patientId)),
    );
  }
}
