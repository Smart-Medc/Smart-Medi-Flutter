part of 'get_medications_cubit.dart';

@immutable
sealed class GetMedicationsState {}

final class GetMedicationsInitial extends GetMedicationsState {}
final class GetMedicationsLoading extends GetMedicationsState {}
final class GetMedicationsFailure extends GetMedicationsState {
   GetMedicationsFailure(this.message);
  final String message;
}
final class GetMedicationsSuccess extends GetMedicationsState {
  GetMedicationsSuccess(this.medications);
  final GetMedicationResponse medications;
}
