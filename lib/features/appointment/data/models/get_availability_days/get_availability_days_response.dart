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

extension AvailabilityStatusValue on AvailabilityStatus {
  String get value {
    switch (this) {
      case AvailabilityStatus.available:
        return 'Available';

      case AvailabilityStatus.closed:
        return 'Closed';
    }
  }
}

class GetAvailabilityDaysResponse {

  const GetAvailabilityDaysResponse({
    required this.date,
    required this.status,
  });

  factory GetAvailabilityDaysResponse.fromJson(
      Map<String, dynamic> json,
      ) {
    return GetAvailabilityDaysResponse(
      date: DateTime.parse(json['date'] as String),
      status:
      (json['status'] as String).toAvailabilityStatus(),
    );
  }
  final DateTime date;
  final AvailabilityStatus status;

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'status': status.value,
    };
  }
}