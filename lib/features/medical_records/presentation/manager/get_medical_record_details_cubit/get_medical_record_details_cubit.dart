import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_record_details_models/get_medical_record_details_response.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';

part 'get_medical_record_details_state.dart';

class GetMedicalRecordDetailsCubit extends Cubit<GetMedicalRecordDetailsState> {
  GetMedicalRecordDetailsCubit(this.medicalRecordsRepo) : super(GetMedicalRecordDetailsInitial());
  final MedicalRecordsRepo medicalRecordsRepo;
  Future<void> getMedicalRecordDetails({required String patientId, required String recordId}) async {
    emit(GetMedicalRecordDetailsLoading());
    final result = await medicalRecordsRepo.getMedicalRecordDetails(patientId: patientId, recordId: recordId);
    result.fold(
      (failure) => emit(GetMedicalRecordDetailsFailure(message: failure.message)),
      (response) => emit(GetMedicalRecordDetailsSuccess(medicalRecordDetailsResponse: response)),
    );
  }
}
