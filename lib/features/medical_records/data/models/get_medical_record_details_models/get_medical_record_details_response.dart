import 'package:intl/intl.dart';

class GetMedicalRecordDetailsResponse {
  GetMedicalRecordDetailsResponse({
    required this.documents,
    required this.id,
    required this.title,
    required this.description,
    required this.recordType,
    required this.recordTypeName,
    required this.recordDate,
    this.providerName,
    this.orderedBy,
    required this.status,
    required this.statusName,
    required this.createdAt,
    this.updatedAt,
    required this.findingsSummary,
    required this.documentCount,
    required this.totalDocumentSize,
  });

  factory GetMedicalRecordDetailsResponse.fromJson(
      Map<String, dynamic> json,
      ) {
    return GetMedicalRecordDetailsResponse(
      documents: (json['documents'] as List<dynamic>?) ?? [],
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      recordType: json['recordType'] ?? '',
      recordTypeName: json['recordTypeName'] ?? '',
      recordDate: DateTime.parse(json['recordDate']),
      providerName: json['providerName'],
      orderedBy: json['orderedBy'],
      status: json['status'] ?? '',
      statusName: json['statusName'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      findingsSummary: json['findingsSummary'] ?? '',
      documentCount: json['documentCount'] ?? 0,
      totalDocumentSize: json['totalDocumentSize'] ?? 0,
    );
  }

  final List<dynamic> documents;

  final String id;
  final String title;
  final String description;
  final String recordType;
  final String recordTypeName;
  final DateTime recordDate;
  final String? providerName;
  final String? orderedBy;
  final String status;
  final String statusName;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String findingsSummary;
  final int documentCount;
  final int totalDocumentSize;

  String get formattedRecordDate =>
      DateFormat('MMM dd, yyyy').format(recordDate);

  String get formattedCreatedAt =>
      DateFormat('MMM dd, yyyy').format(createdAt);

  String get formattedRecordDateWithTime =>
      DateFormat('MMM dd, yyyy • hh:mm a').format(recordDate);

  String get formattedCreatedAtWithTime =>
      DateFormat('MMM dd, yyyy • hh:mm a').format(createdAt);

  Map<String, dynamic> toJson() {
    return {
      'documents': documents,
      'id': id,
      'title': title,
      'description': description,
      'recordType': recordType,
      'recordTypeName': recordTypeName,
      'recordDate': recordDate.toIso8601String(),
      'providerName': providerName,
      'orderedBy': orderedBy,
      'status': status,
      'statusName': statusName,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'findingsSummary': findingsSummary,
      'documentCount': documentCount,
      'totalDocumentSize': totalDocumentSize,
    };
  }
}