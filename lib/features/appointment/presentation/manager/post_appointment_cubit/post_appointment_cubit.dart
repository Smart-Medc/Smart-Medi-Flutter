import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/appointment/data/models/post_appointment_models/post_appointment_request.dart';
import 'package:smart_medi/features/appointment/data/models/post_appointment_models/post_appointment_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'post_appointment_state.dart';

class PostAppointmentCubit extends Cubit<PostAppointmentState> {
  PostAppointmentCubit(this.appointmentRepo) : super(PostAppointmentInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> postAppointment({required PostAppointmentRequest postAppointmentRequest}) async {
    emit(PostAppointmentLoading());
    final result = await appointmentRepo.postAppointment(
      postAppointmentRequest: postAppointmentRequest,
    );
    result.fold(
      (failure) => emit(PostAppointmentFailure(message: failure.message)),
      (postAppointmentResponse) => emit(PostAppointmentSuccess(postAppointmentResponse: postAppointmentResponse)),
    );
  }
}
