class PostAppointmentResponse {
  final String id;
  final String appointmentNumber;
  final String organizationName;
  final String patientName;
  final String doctorName;
  final DateTime date;
  final String time;
  final int durationMinutes;
  final String status;
  final String visitType;

  PostAppointmentResponse({
    required this.id,
    required this.appointmentNumber,
    required this.organizationName,
    required this.patientName,
    required this.doctorName,
    required this.date,
    required this.time,
    required this.durationMinutes,
    required this.status,
    required this.visitType,
  });

  factory PostAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return PostAppointmentResponse(
      id: json['id'] as String,
      appointmentNumber: json['appointmentNumber'] as String,
      organizationName: json['organizationName'] as String,
      patientName: json['patientName'] as String,
      doctorName: json['doctorName'] as String,
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
      durationMinutes: json['durationMinutes'] as int,
      status: json['status'] as String,
      visitType: json['visitType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'appointmentNumber': appointmentNumber,
      'organizationName': organizationName,
      'patientName': patientName,
      'doctorName': doctorName,
      'date': date.toUtc().toIso8601String(),
      'time': time,
      'durationMinutes': durationMinutes,
      'status': status,
      'visitType': visitType,
    };
  }

  PostAppointmentResponse copyWith({
    String? id,
    String? appointmentNumber,
    String? organizationName,
    String? patientName,
    String? doctorName,
    DateTime? date,
    String? time,
    int? durationMinutes,
    String? status,
    String? visitType,
  }) {
    return PostAppointmentResponse(
      id: id ?? this.id,
      appointmentNumber: appointmentNumber ?? this.appointmentNumber,
      organizationName: organizationName ?? this.organizationName,
      patientName: patientName ?? this.patientName,
      doctorName: doctorName ?? this.doctorName,
      date: date ?? this.date,
      time: time ?? this.time,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      status: status ?? this.status,
      visitType: visitType ?? this.visitType,
    );
  }
}