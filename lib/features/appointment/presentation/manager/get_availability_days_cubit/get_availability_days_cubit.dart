import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_days/get_availability_days_request.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_days/get_availability_days_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'get_availability_days_state.dart';

class GetAvailabilityDaysCubit extends Cubit<GetAvailabilityDaysState> {
  GetAvailabilityDaysCubit(this.appointmentRepo) : super(GetAvailabilityDaysInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getAvailabilityDays({required GetAvailabilityDaysRequest request}) async {
    emit(GetAvailabilityDaysLoading());
    final result = await appointmentRepo.getAvailabilityDays(request: request);
    result.fold(
      (failure) => emit(GetAvailabilityDaysFailure(message: failure.message)),
      (availabilityDays) => emit(GetAvailabilityDaysSuccess(availabilityDays: availabilityDays)),
    );
  }
}
