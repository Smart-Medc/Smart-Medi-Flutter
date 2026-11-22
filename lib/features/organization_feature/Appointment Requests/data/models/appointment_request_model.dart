class AppointmentRequestModel {
  final String patientName;
  final String status;
  final String date;
  final String time;
  final String recordsShared;
  final String reason;
  final String requestedAgo;

  const AppointmentRequestModel({
    required this.patientName,
    required this.status,
    required this.date,
    required this.time,
    required this.recordsShared,
    required this.reason,
    required this.requestedAgo,
  });
}

class AppointmentSummaryModel {
  final String title;
  final String value;
  final AppointmentSummaryType type;

  const AppointmentSummaryModel({
    required this.title,
    required this.value,
    required this.type,
  });
}

enum AppointmentSummaryType {
  pending,
  accepted,
  rejected,
}
