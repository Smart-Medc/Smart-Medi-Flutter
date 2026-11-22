import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointment_details_models/get_appointment_details_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'get_appointment_details_state.dart';

class GetAppointmentDetailsCubit extends Cubit<GetAppointmentDetailsState> {
  GetAppointmentDetailsCubit(this.appointmentRepo) : super(GetAppointmentDetailsInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getAppointmentDetails({required String appointmentId}) async {
    emit(GetAppointmentDetailsLoading());
    final result = await appointmentRepo.getPatientAppointmentDetails(appointmentId: appointmentId);
    result.fold(
          (failure) => emit(GetAppointmentDetailsFailure(message: failure.message)),
          (appointmentDetails) => emit(GetAppointmentDetailsSuccess(appointmentDetailsResponse: appointmentDetails)),
    );
  }
}
