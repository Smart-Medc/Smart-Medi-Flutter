class AddMedicationRequest {

  AddMedicationRequest({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.route,
    required this.instructions,
    required this.startDate,
    this.endDate,
    required this.prescribingDoctor,
  }) {
    if (endDate != null && endDate!.isBefore(startDate)) {
      throw ArgumentError('End date must be after start date');
    }
  }
  final String name;
  final String dosage;
  final String frequency;
  final String route;
  final String instructions;
  final DateTime startDate;
  final DateTime? endDate;
  final String prescribingDoctor;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dosage': dosage,
      'frequency': frequency,
      'route': route,
      'instructions': instructions,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'prescribingDoctor': prescribingDoctor,
    };
  }
}

