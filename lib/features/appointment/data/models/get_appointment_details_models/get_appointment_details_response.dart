class GetAppointmentDetailsResponse {

  GetAppointmentDetailsResponse({
    required this.address,
    required this.phone,
    required this.reason,
    required this.isRecordsShared,
    this.accessCode,
    required this.cancellationPolicy,
    this.preparationInstructions,
    required this.history,
    this.completionNotes,
    required this.organizationId,
    required this.patientAge,
    required this.patientGender,
    required this.patientEmail,
    required this.patientPhone,
    required this.patientEmergencyContact,
    required this.patientEmergencyContactPhone,
    this.patientAllergies,
    required this.patientHasNoKnownAllergies,
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

  factory GetAppointmentDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetAppointmentDetailsResponse(
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      reason: json['reason'] ?? '',
      isRecordsShared: json['isRecordsShared'] ?? false,
      accessCode: json['accessCode'],
      cancellationPolicy: json['cancellationPolicy'] ?? '',
      preparationInstructions: json['preparationInstructions'],
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => AppointmentHistoryModel.fromJson(e))
          .toList() ??
          [],
      completionNotes: json['completionNotes'],
      organizationId: json['organizationId'] ?? '',
      patientAge: json['patientAge'] ?? 0,
      patientGender: json['patientGender'] ?? '',
      patientEmail: json['patientEmail'] ?? '',
      patientPhone: json['patientPhone'] ?? '',
      patientEmergencyContact: json['patientEmergencyContact'] ?? '',
      patientEmergencyContactPhone:
      json['patientEmergencyContactPhone'] ?? '',
      patientAllergies: json['patientAllergies'],
      patientHasNoKnownAllergies:
      json['patientHasNoKnownAllergies'] ?? false,
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
  final String address;
  final String phone;
  final String reason;
  final bool isRecordsShared;
  final String? accessCode;
  final String cancellationPolicy;
  final String? preparationInstructions;
  final List<AppointmentHistoryModel> history;
  final String? completionNotes;
  final String organizationId;
  final int patientAge;
  final String patientGender;
  final String patientEmail;
  final String patientPhone;
  final String patientEmergencyContact;
  final String patientEmergencyContactPhone;
  final String? patientAllergies;
  final bool patientHasNoKnownAllergies;

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

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'phone': phone,
      'reason': reason,
      'isRecordsShared': isRecordsShared,
      'accessCode': accessCode,
      'cancellationPolicy': cancellationPolicy,
      'preparationInstructions': preparationInstructions,
      'history': history.map((e) => e.toJson()).toList(),
      'completionNotes': completionNotes,
      'organizationId': organizationId,
      'patientAge': patientAge,
      'patientGender': patientGender,
      'patientEmail': patientEmail,
      'patientPhone': patientPhone,
      'patientEmergencyContact': patientEmergencyContact,
      'patientEmergencyContactPhone': patientEmergencyContactPhone,
      'patientAllergies': patientAllergies,
      'patientHasNoKnownAllergies': patientHasNoKnownAllergies,
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
}
class AppointmentHistoryModel {

  AppointmentHistoryModel({
    required this.fromStatus,
    required this.toStatus,
    required this.changedAt,
    required this.reason,
  });

  factory AppointmentHistoryModel.fromJson(Map<String, dynamic> json) {
    return AppointmentHistoryModel(
      fromStatus: json['fromStatus'] ?? '',
      toStatus: json['toStatus'] ?? '',
      changedAt: DateTime.parse(json['changedAt']),
      reason: json['reason'] ?? '',
    );
  }
  final String fromStatus;
  final String toStatus;
  final DateTime changedAt;
  final String reason;

  Map<String, dynamic> toJson() {
    return {
      'fromStatus': fromStatus,
      'toStatus': toStatus,
      'changedAt': changedAt.toIso8601String(),
      'reason': reason,
    };
  }
}