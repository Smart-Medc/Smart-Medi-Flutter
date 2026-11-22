import 'package:intl/intl.dart';

class PostAppointmentResponse {

  factory PostAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return PostAppointmentResponse(
      id: json['id'] ?? '',
      appointmentNumber: json['appointmentNumber'] ?? '',
      organizationName: json['organizationName'] ?? '',
      patientName: json['patientName'] ?? '',
      doctorName: json['doctorName'] ?? '',
      date: DateTime.parse(json['date']),
      time: json['time'] ?? '',
      durationMinutes: json['durationMinutes'] ?? 0,
      status: json['status'] ?? '',
      visitType: json['visitType'] ?? '',
    );
  }

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

  /// Formatted date => Jul 06, 2026
  String get formattedDate =>
      DateFormat('MMM dd, yyyy').format(date);

  /// Formatted time => 09:30 AM
  String get formattedTime {
    try {
      return DateFormat('hh:mm a').format(
        DateFormat('HH:mm:ss').parse(time),
      );
    } catch (_) {
      try {
        return DateFormat('hh:mm a').format(
          DateFormat('HH:mm').parse(time),
        );
      } catch (_) {
        return time;
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'appointmentNumber': appointmentNumber,
      'organizationName': organizationName,
      'patientName': patientName,
      'doctorName': doctorName,
      'date': date.toIso8601String(),
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
      appointmentNumber:
      appointmentNumber ?? this.appointmentNumber,
      organizationName:
      organizationName ?? this.organizationName,
      patientName: patientName ?? this.patientName,
      doctorName: doctorName ?? this.doctorName,
      date: date ?? this.date,
      time: time ?? this.time,
      durationMinutes:
      durationMinutes ?? this.durationMinutes,
      status: status ?? this.status,
      visitType: visitType ?? this.visitType,
    );
  }
}