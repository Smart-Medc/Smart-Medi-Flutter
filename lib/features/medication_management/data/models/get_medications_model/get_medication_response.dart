class GetMedicationResponse {

  GetMedicationResponse({required this.medications});

  factory GetMedicationResponse.fromJson(List<dynamic> json) {
    return GetMedicationResponse(
      medications: (json as List)
          .map((medication) => MedicationModel.fromJson(medication as Map<String, dynamic>))
          .toList(),
    );
  }
  final List<MedicationModel> medications;

  List<Map<String, dynamic>> toJson() {
    return medications.map((medication) => medication.toJson()).toList();
  }
}

class MedicationModel {

  MedicationModel({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.route,
    required this.routeName,
    required this.instructions,
    required this.startDate,
    this.endDate,
    required this.prescribingDoctor,
    required this.status,
    required this.statusName,
    required this.hasInteraction,
    this.interactionNotes,
    required this.createdAt,
    required this.reminderCount,
    required this.adherencePercentage,
  });

  factory MedicationModel.fromJson(Map<String, dynamic> json) {
    return MedicationModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      dosage: json['dosage'] as String? ?? '',
      frequency: json['frequency'] as String? ?? '',
      route: json['route'] as String? ?? '',
      routeName: json['routeName'] as String? ?? '',
      instructions: json['instructions'] as String? ?? '',
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'] as String)
          : DateTime.now(),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      prescribingDoctor: json['prescribingDoctor'] as String? ?? '',
      status: json['status'] as String? ?? '',
      statusName: json['statusName'] as String? ?? '',
      hasInteraction: json['hasInteraction'] as bool? ?? false,
      interactionNotes: json['interactionNotes'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      reminderCount: json['reminderCount'] as int? ?? 0,
      adherencePercentage: (json['adherencePercentage'] as num?)?.toDouble() ?? 0.0,
    );
  }
  final String id;
  final String name;
  final String dosage;
  final String frequency;
  final String route;
  final String routeName;
  final String instructions;
  final DateTime startDate;
  final DateTime? endDate;
  final String prescribingDoctor;
  final String status;
  final String statusName;
  final bool hasInteraction;
  final String? interactionNotes;
  final DateTime createdAt;
  final int reminderCount;
  final double adherencePercentage;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
      'frequency': frequency,
      'route': route,
      'routeName': routeName,
      'instructions': instructions,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'prescribingDoctor': prescribingDoctor,
      'status': status,
      'statusName': statusName,
      'hasInteraction': hasInteraction,
      'interactionNotes': interactionNotes,
      'createdAt': createdAt.toIso8601String(),
      'reminderCount': reminderCount,
      'adherencePercentage': adherencePercentage,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          dosage == other.dosage &&
          frequency == other.frequency &&
          route == other.route &&
          routeName == other.routeName &&
          instructions == other.instructions &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          prescribingDoctor == other.prescribingDoctor &&
          status == other.status &&
          statusName == other.statusName &&
          hasInteraction == other.hasInteraction &&
          interactionNotes == other.interactionNotes &&
          createdAt == other.createdAt &&
          reminderCount == other.reminderCount &&
          adherencePercentage == other.adherencePercentage;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      dosage.hashCode ^
      frequency.hashCode ^
      route.hashCode ^
      routeName.hashCode ^
      instructions.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      prescribingDoctor.hashCode ^
      status.hashCode ^
      statusName.hashCode ^
      hasInteraction.hashCode ^
      interactionNotes.hashCode ^
      createdAt.hashCode ^
      reminderCount.hashCode ^
      adherencePercentage.hashCode;

  @override
  String toString() {
    return 'MedicationModel(id: $id, name: $name, dosage: $dosage, frequency: $frequency, route: $route, routeName: $routeName, instructions: $instructions, startDate: $startDate, endDate: $endDate, prescribingDoctor: $prescribingDoctor, status: $status, statusName: $statusName, hasInteraction: $hasInteraction, interactionNotes: $interactionNotes, createdAt: $createdAt, reminderCount: $reminderCount, adherencePercentage: $adherencePercentage)';
  }
}

