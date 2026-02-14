class RecordTypeModel {
  final String typeName;
  final List<String> records;
  bool isTypeSelected;
  final Map<String, bool> selectedRecords;

  RecordTypeModel({
    required this.typeName,
    required this.records,
    this.isTypeSelected = false,
  }) : selectedRecords = {for (var record in records) record: false};

  void toggleType() {
    isTypeSelected = !isTypeSelected;
    for (var record in records) {
      selectedRecords[record] = isTypeSelected;
    }
  }

  void toggleRecord(String record) {
    selectedRecords[record] = !(selectedRecords[record] ?? false);

    // Update type selection based on individual records
    isTypeSelected = selectedRecords.values.every((selected) => selected);
  }

  bool get hasSelectedRecords {
    return selectedRecords.values.any((selected) => selected);
  }

  List<String> get getSelectedRecords {
    return selectedRecords.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  static List<RecordTypeModel> getRecordTypes() {
    return [
      RecordTypeModel(
        typeName: 'Lab Results',
        records: ['Blood Test Results', 'Urine Analysis', 'Complete Blood Count'],
      ),
      RecordTypeModel(
        typeName: 'Imaging',
        records: ['X-Ray', 'MRI Scan', 'CT Scan'],
      ),
      RecordTypeModel(
        typeName: 'Checkups',
        records: ['Annual Physical Examination', 'Routine Checkup', 'Follow-up Visit'],
      ),
      RecordTypeModel(
        typeName: 'Cardiology',
        records: ['ECG Report', 'Echocardiogram', 'Stress Test'],
      ),
      RecordTypeModel(
        typeName: 'Medications',
        records: ['Prescriptionary', 'Current Medications', 'Medication History'],
      ),
    ];
  }
}

