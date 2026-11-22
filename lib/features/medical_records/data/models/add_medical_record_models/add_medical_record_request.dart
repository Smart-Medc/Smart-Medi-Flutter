class AddMedicalRecordRequest {

  factory AddMedicalRecordRequest.fromJson(Map<String, dynamic> json) {
    return AddMedicalRecordRequest(
      title: json['title'] ?? '',
      recordType: json['recordType'] ?? '',
      recordDate: DateTime.parse(json['recordDate']),

      description: json['description'],
      providerName: json['providerName'],
      orderedBy: json['orderedBy'],
      findingsSummary: json['findingsSummary'],
    );
  }

  AddMedicalRecordRequest({
    required this.title,
    required this.recordType,
    required this.recordDate,
    this.description,
    this.providerName,
    this.orderedBy,
    this.findingsSummary,
  });
  final String title;
  final String recordType;
  final DateTime recordDate;

  final String? description;
  final String? providerName;
  final String? orderedBy;
  final String? findingsSummary;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'recordType': recordType,
      'recordDate': recordDate.toIso8601String(),
      'description': description,
      'providerName': providerName,
      'orderedBy': orderedBy,
      'findingsSummary': findingsSummary,
    };
  }
}