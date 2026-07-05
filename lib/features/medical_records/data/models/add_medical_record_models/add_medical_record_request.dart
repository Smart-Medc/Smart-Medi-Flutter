class AddMedicalRecordRequest {

  AddMedicalRecordRequest({
    required this.title,
    required this.description,
    required this.recordType,
    required this.recordDate,
    required this.providerName,
    required this.orderedBy,
    required this.findingsSummary,
  });

  factory AddMedicalRecordRequest.fromJson(Map<String, dynamic> json) {
    return AddMedicalRecordRequest(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      recordType: json['recordType'] ?? '',
      recordDate: DateTime.parse(json['recordDate']),
      providerName: json['providerName'] ?? '',
      orderedBy: json['orderedBy'] ?? '',
      findingsSummary: json['findingsSummary'] ?? '',
    );
  }
  final String title;
  final String description;
  final String recordType;
  final DateTime recordDate;
  final String providerName;
  final String orderedBy;
  final String findingsSummary;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'recordType': recordType,
      'recordDate': recordDate.toIso8601String(),
      'providerName': providerName,
      'orderedBy': orderedBy,
      'findingsSummary': findingsSummary,
    };
  }
}