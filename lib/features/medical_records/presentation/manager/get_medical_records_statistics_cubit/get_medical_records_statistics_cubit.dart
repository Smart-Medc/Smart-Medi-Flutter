import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_statistics/get_medical_records_statistics_response.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';

part 'get_medical_records_statistics_state.dart';

class GetMedicalRecordsStatisticsCubit extends Cubit<GetMedicalRecordsStatisticsState> {
  GetMedicalRecordsStatisticsCubit(this.medicalRecordsRepo) : super(GetMedicalRecordsStatisticsInitial());
  final MedicalRecordsRepo medicalRecordsRepo;
  Future<void> getMedicalRecordsStatistics() async {
    emit(GetMedicalRecordsStatisticsLoading());
    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.trim().isEmpty) {
      emit(
        GetMedicalRecordsStatisticsFailure(message: 'Patient ID not found. Please login again.'),
      );
      return;
    }
    final result = await medicalRecordsRepo.getMedicalRecordsStatistics(patientId: patientId);
    result.fold(
      (failure) => emit(GetMedicalRecordsStatisticsFailure(message: failure.message)),
      (statistics) => emit(GetMedicalRecordsStatisticsSuccess(statistics: statistics)),
    );
  }
}
