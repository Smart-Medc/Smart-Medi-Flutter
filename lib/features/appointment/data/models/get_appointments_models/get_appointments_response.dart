class GetAppointmentsResponse {

  GetAppointmentsResponse({
    required this.items,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory GetAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    return GetAppointmentsResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => AppointmentItem.fromJson(e))
          .toList() ??
          [],
      totalCount: json['totalCount'] ?? 0,
      pageNumber: json['pageNumber'] ?? 1,
      pageSize: json['pageSize'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      hasNextPage: json['hasNextPage'] ?? false,
      hasPreviousPage: json['hasPreviousPage'] ?? false,
    );
  }
  final List<AppointmentItem> items;
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'totalCount': totalCount,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'totalPages': totalPages,
      'hasNextPage': hasNextPage,
      'hasPreviousPage': hasPreviousPage,
    };
  }
}

class AppointmentItem {

  AppointmentItem({
    required this.id,
    required this.appointmentNumber,
    required this.organizationName,
    this.patientName,
    required this.doctorName,
    required this.date,
    required this.time,
    required this.durationMinutes,
    required this.status,
    required this.visitType,
  });

  factory AppointmentItem.fromJson(Map<String, dynamic> json) {
    return AppointmentItem(
      id: json['id'] ?? '',
      appointmentNumber: json['appointmentNumber'] ?? '',
      organizationName: json['organizationName'] ?? '',
      patientName: json['patientName'],
      doctorName: json['doctorName'] ?? '',
      date: DateTime.parse(json['date']),
      time: json['time'] ?? '',
      durationMinutes: json['durationMinutes'] ?? 0,
      status: json['status'] ?? '',
      visitType: json['visitType'] ?? '',
    );
  }
  final String id;
  final String appointmentNumber;
  final String organizationName;
  final String? patientName;
  final String doctorName;
  final DateTime date;
  final String time;
  final int durationMinutes;
  final String status;
  final String visitType;

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
}