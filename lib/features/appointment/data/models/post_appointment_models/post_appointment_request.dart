class PostAppointmentRequest {

  PostAppointmentRequest({
    required this.organizationId,
    this.doctorId,
    required this.date,
    required this.startTime,
    required this.visitType,
    required this.reason,
    required this.shareRecords,
    required this.recordsToShare,
  });

  factory PostAppointmentRequest.fromJson(Map<String, dynamic> json) {
    return PostAppointmentRequest(
      organizationId: json['organizationId'] as String,
      doctorId: json['doctorId'] as String?,
      date: DateTime.parse(json['date'] as String),
      startTime: json['startTime'] as String,
      visitType: json['visitType'] as String,
      reason: json['reason'] as String,
      shareRecords: json['shareRecords'] as bool,
      recordsToShare: List<String>.from(
        json['recordsToShare'] ?? [],
      ),
    );
  }
  final String organizationId;
  final String? doctorId;
  final DateTime date;
  final String startTime;
  final String visitType;
  final String reason;
  final bool shareRecords;
  final List<String> recordsToShare;

  Map<String, dynamic> toJson() {
    return {
      'organizationId': organizationId,
      'doctorId': doctorId,
      'date': date.toUtc().toIso8601String(),
      'startTime': startTime,
      'visitType': visitType,
      'reason': reason,
      'shareRecords': shareRecords,
      'recordsToShare': recordsToShare,
    };
  }

  PostAppointmentRequest copyWith({
    String? organizationId,
    String? doctorId,
    DateTime? date,
    String? startTime,
    String? visitType,
    String? reason,
    bool? shareRecords,
    List<String>? recordsToShare,
  }) {
    return PostAppointmentRequest(
      organizationId: organizationId ?? this.organizationId,
      doctorId: doctorId ?? this.doctorId,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      visitType: visitType ?? this.visitType,
      reason: reason ?? this.reason,
      shareRecords: shareRecords ?? this.shareRecords,
      recordsToShare: recordsToShare ?? this.recordsToShare,
    );
  }
}