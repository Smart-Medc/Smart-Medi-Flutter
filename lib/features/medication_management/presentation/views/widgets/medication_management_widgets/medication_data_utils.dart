import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';

bool isCurrentMedication(MedicationModel medication) {
  // Business rule: only active medications are considered current.
  return medication.status.trim().toLowerCase() == 'active';
}

bool isPastMedication(MedicationModel medication) {
  // Business rule: only complete medications are considered past.
  return medication.status.trim().toLowerCase() == 'complete';
}

int getInteractionsCount(List<MedicationModel> medications) {
  return medications.where((medication) => medication.hasInteraction).length;
}

int getAverageAdherencePercentage(List<MedicationModel> medications) {
  if (medications.isEmpty) {
    return 0;
  }

  final adherenceAverage = medications
          .map((medication) => medication.adherencePercentage)
          .reduce((a, b) => a + b) /
      medications.length;

  return adherenceAverage.round().clamp(0, 100);
}

String formatMedicationDate(DateTime date) {
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${months[date.month - 1]} ${date.day}, ${date.year}';
}

bool matchesMedicationQuery(MedicationModel medication, String query) {
  final normalizedQuery = query.trim().toLowerCase();
  if (normalizedQuery.isEmpty) {
    return true;
  }

  final routeValue = medication.routeName.isNotEmpty
      ? medication.routeName
      : medication.route;

  final searchableValues = <String>[
    medication.name,
    medication.dosage,
    medication.frequency,
    routeValue,
    medication.prescribingDoctor,
    medication.statusName,
  ];

  return searchableValues
      .any((value) => value.toLowerCase().contains(normalizedQuery));
}

