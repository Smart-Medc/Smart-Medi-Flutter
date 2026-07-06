class ShareRecordsRequest {

  ShareRecordsRequest({
    required this.specificRecordIds,
    required this.expirationType,
  });

  factory ShareRecordsRequest.fromJson(Map<String, dynamic> json) {
    return ShareRecordsRequest(
      specificRecordIds: List<String>.from(json['specificRecordIds'] ?? []),
      expirationType: json['expirationType'] ?? '',
    );
  }
  final List<String> specificRecordIds;
  final String expirationType;

  Map<String, dynamic> toJson() {
    return {
      'specificRecordIds': specificRecordIds,
      'expirationType': expirationType,
    };
  }
}