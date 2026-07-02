part of 'book_appointment_cubit.dart';

@immutable
class BookAppointmentState {
  final DateTime selectedDate;
  final String? selectedTime;
  final bool isConfirmed;

  const BookAppointmentState({
    required this.selectedDate,
    this.selectedTime,
    this.isConfirmed = false,
  });

  BookAppointmentState copyWith({
    DateTime? selectedDate,
    String? selectedTime,
    bool? isConfirmed,
  }) {
    return BookAppointmentState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
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
