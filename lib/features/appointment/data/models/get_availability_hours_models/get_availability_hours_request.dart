class GetAvailabilityHoursRequest {

  const GetAvailabilityHoursRequest({
    required this.organizationId,
    required this.date,
  });
  final String organizationId;
  final DateTime date;

  Map<String, dynamic> toQueryParameters() {
    return {
      'date': date.toIso8601String(),
    };
  }
}