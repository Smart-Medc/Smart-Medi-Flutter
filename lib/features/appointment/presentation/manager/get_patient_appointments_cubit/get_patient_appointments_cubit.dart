import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'get_patient_appointments_state.dart';

class GetPatientAppointmentsCubit extends Cubit<GetPatientAppointmentsState> {
  GetPatientAppointmentsCubit({required this.appointmentRepo}) : super(GetPatientAppointmentsInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getPatientAppointments({required String patientId}) async {
    emit(GetPatientAppointmentsLoading());
    final result = await appointmentRepo.getPatientAppointments(patientId: patientId);
    result.fold(
          (failure) => emit(GetPatientAppointmentsFailure(message: failure.message)),
          (appointmentsResponse) => emit(GetPatientAppointmentsSuccess(appointmentsResponse: appointmentsResponse)),
    );
  }
}
