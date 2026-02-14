class SharedRecordModel {
  final String id;
  final String sharedWith;
  final DateTime createdDate;
  final DateTime expiresDate;
  final int accessedCount;
  final List<String> sharedRecords;
  final bool isRevoked; // Manual revocation flag

  const SharedRecordModel({
    required this.id,
    required this.sharedWith,
    required this.createdDate,
    required this.expiresDate,
    required this.accessedCount,
    required this.sharedRecords,
    this.isRevoked = false, // Default to not revoked
  });

  /// Check if the share has expired based on current date
  bool get isExpired => DateTime.now().isAfter(expiresDate);

  /// Check if the share is currently active (not expired and not revoked)
  bool get isActive => !isExpired && !isRevoked;
}

