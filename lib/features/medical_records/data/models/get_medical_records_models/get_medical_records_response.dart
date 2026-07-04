import 'package:intl/intl.dart';

class GetMedicalRecordsResponse {
  GetMedicalRecordsResponse({
    required this.items,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory GetMedicalRecordsResponse.fromJson(Map<String, dynamic> json) {
    return GetMedicalRecordsResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MedicalRecordModel.fromJson(e))
          .toList() ??
          [],
      totalCount: json['totalCount'] ?? 0,
      pageNumber: json['pageNumber'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      hasNextPage: json['hasNextPage'] ?? false,
      hasPreviousPage: json['hasPreviousPage'] ?? false,
    );
  }

  final List<MedicalRecordModel> items;
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

class MedicalRecordModel {
  MedicalRecordModel({
    required this.id,
    required this.title,
    required this.description,
    required this.recordType,
    required this.recordTypeName,
    required this.recordDate,
    required this.providerName,
    required this.orderedBy,
    required this.status,
    required this.statusName,
    required this.createdAt,
    this.updatedAt,
    required this.findingsSummary,
    required this.documentCount,
    required this.totalDocumentSize,
  });

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      recordType: json['recordType'] ?? '',
      recordTypeName: json['recordTypeName'] ?? '',
      recordDate: DateTime.parse(json['recordDate']),
      providerName: json['providerName'] ?? '',
      orderedBy: json['orderedBy'] ?? '',
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

  final String id;
  final String title;
  final String description;
  final String recordType;
  final String recordTypeName;
  final DateTime recordDate;
  final String providerName;
  final String orderedBy;
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