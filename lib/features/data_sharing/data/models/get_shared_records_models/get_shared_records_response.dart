import 'package:intl/intl.dart';

class GetSharedRecordsResponse {
  GetSharedRecordsResponse({
    required this.items,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory GetSharedRecordsResponse.fromJson(Map<String, dynamic> json) {
    return GetSharedRecordsResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SharedRecordModel.fromJson(e))
          .toList() ??
          [],
      totalCount: json['totalCount'] ?? 0,
      pageNumber: json['pageNumber'] ?? 1,
      pageSize: json['pageSize'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
      hasNextPage: json['hasNextPage'] ?? false,
      hasPreviousPage: json['hasPreviousPage'] ?? false,
    );
  }

  final List<SharedRecordModel> items;
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  /// ===== Summary Logic =====

  int get activeCount =>
      items.where((e) => e.status.toLowerCase() == 'active').length;

  int get expiredCount =>
      items.where((e) => e.isExpired).length;

  int get revokedCount =>
      items.where((e) => e.status.toLowerCase() == 'revoked').length;

  int get totalAccesses =>
      items.fold(0, (sum, item) => sum + item.accessCount);

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

class SharedRecordModel {
  SharedRecordModel({
    required this.id,
    required this.code,
    required this.shareUrl,
    required this.expiresAt,
    required this.status,
    required this.accessCount,
    required this.sharedRecordsSummary,
  });

  factory SharedRecordModel.fromJson(Map<String, dynamic> json) {
    return SharedRecordModel(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      shareUrl: json['shareUrl'] ?? '',
      expiresAt: DateTime.parse(json['expiresAt']),
      status: json['status'] ?? '',
      accessCount: json['accessCount'] ?? 0,
      sharedRecordsSummary:
      (json['sharedRecordsSummary'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
    );
  }

  final String id;
  final String code;
  final String shareUrl;
  final DateTime expiresAt;
  final String status;
  final int accessCount;
  final List<String> sharedRecordsSummary;

  bool get isExpired => expiresAt.isBefore(DateTime.now());

  bool get isActive =>
      status.toLowerCase() == 'active' && !isExpired;

  bool get isRevoked =>
      status.toLowerCase() == 'revoked';

  String get formattedExpiryDate =>
      DateFormat('MMM dd, yyyy').format(expiresAt);

  String get formattedExpiryTime =>
      DateFormat('hh:mm a').format(expiresAt);

  String get formattedExpiryDateTime =>
      DateFormat('MMM dd, yyyy • hh:mm a').format(expiresAt);

  String get recordsSummaryText =>
      sharedRecordsSummary.join(', ');

  String get accessText =>
      accessCount == 1 ? '1 access' : '$accessCount accesses';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'shareUrl': shareUrl,
      'expiresAt': expiresAt.toIso8601String(),
      'status': status,
      'accessCount': accessCount,
      'sharedRecordsSummary': sharedRecordsSummary,
    };
  }
}