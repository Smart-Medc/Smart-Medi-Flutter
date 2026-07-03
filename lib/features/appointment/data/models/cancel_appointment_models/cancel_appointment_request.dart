class CancelAppointmentRequest {

  const CancelAppointmentRequest({
    required this.appointmentId,
    required this.reason,
  });
  final String appointmentId;
  final String reason;

  Map<String, dynamic> toJson() {
    return {
      'reason': reason,
    };
  }
}