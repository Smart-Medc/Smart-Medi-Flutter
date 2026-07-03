import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_hours_models/get_availability_hours_request.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_hours_models/get_availability_hours_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'get_availability_hours_state.dart';

class GetAvailabilityHoursCubit extends Cubit<GetAvailabilityHoursState> {
  GetAvailabilityHoursCubit(this.appointmentRepo) : super(GetAvailabilityHoursInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getAvailabilityHours({required GetAvailabilityHoursRequest request}) async {
    emit(GetAvailabilityHoursLoading());
    final result = await appointmentRepo.getAvailabilityHours(
      request: request,
    );
    result.fold(
      (failure) => emit(GetAvailabilityHoursFailure(message: failure.message)),
      (availabilityHours) => emit(GetAvailabilityHoursSuccess(availabilityHours: availabilityHours)),
    );
  }
}
