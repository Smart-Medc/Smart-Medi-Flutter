part of 'book_appointment_cubit.dart';

@immutable
class BookAppointmentState {
  final DateTime selectedDate;
  final String? selectedTime;
  final bool isConfirmed;

  static const Object _unset = Object();

  const BookAppointmentState({
    required this.selectedDate,
    this.selectedTime,
    this.isConfirmed = false,
  });

  BookAppointmentState copyWith({
    DateTime? selectedDate,
    Object? selectedTime = _unset,
    bool? isConfirmed,
  }) {
    return BookAppointmentState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime:
          identical(selectedTime, _unset) ? this.selectedTime : selectedTime as String?,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAppointmentState &&
          runtimeType == other.runtimeType &&
          selectedDate == other.selectedDate &&
          selectedTime == other.selectedTime &&
          isConfirmed == other.isConfirmed;

  @override
  int get hashCode => selectedDate.hashCode ^ selectedTime.hashCode ^ isConfirmed.hashCode;
}
