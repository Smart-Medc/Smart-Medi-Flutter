import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/appointment/data/models/cancel_appointment_models/cancel_appointment_request.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'cancel_appointment_state.dart';

class CancelAppointmentCubit extends Cubit<CancelAppointmentState> {
  CancelAppointmentCubit(this.appointmentRepo) : super(CancelAppointmentInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> cancelAppointment({required CancelAppointmentRequest request}) async {
    emit(CancelAppointmentLoading());
    final result = await appointmentRepo.cancelAppointment(
      request: request,
    );
    result.fold(
      (failure) => emit(CancelAppointmentFailure(message: failure.message)),
      (_) => emit(CancelAppointmentSuccess()),
    );
  }
}
