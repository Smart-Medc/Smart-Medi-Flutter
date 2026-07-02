import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit()
      : super(BookAppointmentState(selectedDate: DateTime.now()));

  void selectDate(DateTime date) {
    emit(state.copyWith(
      selectedDate: date,
      selectedTime: null,
      isConfirmed: false,
    ));
  }

  void selectTime(String time) {
    emit(state.copyWith(
      selectedTime: time,
      isConfirmed: false,
    ));
  }

  void confirmBooking() {
    if (state.selectedTime != null) {
      emit(state.copyWith(isConfirmed: true));
    }
  }
}
