class GetMedicalRecordsStatisticsResponse {

  const GetMedicalRecordsStatisticsResponse({
    required this.totalRecords,
    required this.labReports,
    required this.imaging,
    required this.consultationNotes,
    required this.immunizations,
    required this.other,
    required this.storageUsedBytes,
    required this.storageLimitBytes,
    required this.storageUsedPercentage,
  });

  factory GetMedicalRecordsStatisticsResponse.fromJson(
      Map<String, dynamic> json,
      ) {
    return GetMedicalRecordsStatisticsResponse(
      totalRecords: json['totalRecords'] ?? 0,
      labReports: json['labReports'] ?? 0,
      imaging: json['imaging'] ?? 0,
      consultationNotes: json['consultationNotes'] ?? 0,
      immunizations: json['immunizations'] ?? 0,
      other: json['other'] ?? 0,
      storageUsedBytes: json['storageUsedBytes'] ?? 0,
      storageLimitBytes: json['storageLimitBytes'] ?? 0,
      storageUsedPercentage: json['storageUsedPercentage'] ?? 0,
    );
  }
  final int totalRecords;
  final int labReports;
  final int imaging;
  final int consultationNotes;
  final int immunizations;
  final int other;
  final int storageUsedBytes;
  final int storageLimitBytes;
  final int storageUsedPercentage;

  Map<String, dynamic> toJson() {
    return {
      'totalRecords': totalRecords,
      'labReports': labReports,
      'imaging': imaging,
      'consultationNotes': consultationNotes,
      'immunizations': immunizations,
      'other': other,
      'storageUsedBytes': storageUsedBytes,
      'storageLimitBytes': storageLimitBytes,
      'storageUsedPercentage': storageUsedPercentage,
    };
  }

  /// Example: 512 B, 2.4 MB, 1.3 GB
  String get formattedStorageUsed =>
      _formatBytes(storageUsedBytes);

  String get formattedStorageLimit =>
      _formatBytes(storageLimitBytes);

  static String _formatBytes(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    }

    final kb = bytes / 1024;
    if (kb < 1024) {
      return '${kb.toStringAsFixed(1)} KB';
    }

    final mb = kb / 1024;
    if (mb < 1024) {
      return '${mb.toStringAsFixed(1)} MB';
    }

    final gb = mb / 1024;
    return '${gb.toStringAsFixed(1)} GB';
  }
}