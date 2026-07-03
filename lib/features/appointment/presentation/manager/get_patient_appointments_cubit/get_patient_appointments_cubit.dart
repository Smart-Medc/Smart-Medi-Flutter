import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'get_patient_appointments_state.dart';

class GetPatientAppointmentsCubit extends Cubit<GetPatientAppointmentsState> {
  GetPatientAppointmentsCubit(this.appointmentRepo) : super(GetPatientAppointmentsInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getPatientAppointments() async {
    emit(GetPatientAppointmentsLoading());
    final patientId = await SecureStorageHelper.getPatientId();
    if (patientId == null || patientId.isEmpty) {
      emit(GetPatientAppointmentsFailure(message: 'Patient ID not found. Please login again.'));
      return;
    }
    final result = await appointmentRepo.getPatientAppointments(patientId: patientId);
    result.fold(
          (failure) => emit(GetPatientAppointmentsFailure(message: failure.message)),
          (appointmentsResponse) => emit(GetPatientAppointmentsSuccess(appointmentsResponse: appointmentsResponse)),
    );
  }
}
