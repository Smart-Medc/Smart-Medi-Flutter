class GetAvailabilityDaysRequest {

  const GetAvailabilityDaysRequest({
    required this.organizationId,
    required this.month,
  });
  final String organizationId;
  final DateTime month;

  Map<String, dynamic> toQueryParameters() {
    return {
      'month': month.toIso8601String(),
    };
  }
}