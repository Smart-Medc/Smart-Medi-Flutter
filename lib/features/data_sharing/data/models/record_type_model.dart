import 'package:smart_medi/features/medical_records/data/models/get_medical_records_models/get_medical_records_response.dart';

class RecordTypeModel {
  RecordTypeModel({
    required this.typeName,
    required this.records,
    this.isTypeSelected = false,
  }) : selectedRecords = {for (var record in records) record.id: false};

  final String typeName;
  final List<MedicalRecordModel> records;
  bool isTypeSelected;
  final Map<String, bool> selectedRecords; // keyed by record id

  void toggleType() {
    isTypeSelected = !isTypeSelected;
    for (var record in records) {
      selectedRecords[record.id] = isTypeSelected;
    }
  }

  void toggleRecord(String recordId) {
    selectedRecords[recordId] = !(selectedRecords[recordId] ?? false);

    // Update type selection based on individual records
    isTypeSelected = selectedRecords.values.every((selected) => selected);
  }

  bool get hasSelectedRecords {
    return selectedRecords.values.any((selected) => selected);
  }

  List<MedicalRecordModel> get getSelectedRecords {
    return records.where((record) => selectedRecords[record.id] == true).toList();
  }

  /// Groups the flat list coming from the API into sections by [recordTypeName].
  static List<RecordTypeModel> fromMedicalRecords(List<MedicalRecordModel> allRecords) {
    final Map<String, List<MedicalRecordModel>> grouped = {};

    for (final record in allRecords) {
      grouped.putIfAbsent(record.recordTypeName, () => []).add(record);
    }

    return grouped.entries
        .map((entry) => RecordTypeModel(typeName: entry.key, records: entry.value))
        .toList();
  }
}