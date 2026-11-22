enum AvailabilityStatus {
  available,
  closed,
}

extension AvailabilityStatusExtension on String {
  AvailabilityStatus toAvailabilityStatus() {
    switch (this) {
      case 'Available':
        return AvailabilityStatus.available;
      case 'Closed':
        return AvailabilityStatus.closed;
      default:
        return AvailabilityStatus.closed;
    }
  }
}
class GetAvailabilityHoursResponse {

  const GetAvailabilityHoursResponse({
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  factory GetAvailabilityHoursResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAvailabilityHoursResponse(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      status: (json['status'] as String).toAvailabilityStatus(),
    );
  }
  final String startTime;
  final String endTime;
  final AvailabilityStatus status;

  static List<GetAvailabilityHoursResponse> fromList(List<dynamic> json) {
    return json
        .map((e) => GetAvailabilityHoursResponse.fromJson(e))
        .toList();
  }
}