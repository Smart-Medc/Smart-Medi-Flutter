import 'package:smart_medi/features/data_sharing/data/models/shared_record_model.dart';

class SharedRecordFactory {
  /// Creates a list of sample shared records for testing/demo purposes
  static List<SharedRecordModel> createSampleRecords() {
    return [
      // Active shares (expires in the future)
      SharedRecordModel(
        id: 'MED-X7K9P',
        sharedWith: 'City Medical Center',
        createdDate: DateTime(2026, 1, 18),
        expiresDate: DateTime(2026, 3, 25),
        accessedCount: 3,
        sharedRecords: ['Blood Test Results', 'Chest X-Ray'],
      ),
      SharedRecordModel(
        id: 'MED-B4L2M',
        sharedWith: 'Dr. Sarah Johnson',
        createdDate: DateTime(2026, 1, 15),
        expiresDate: DateTime(2026, 3, 30),
        accessedCount: 5,
        sharedRecords: ['MRI Scan', 'Lab Report', 'Prescription'],
      ),
      SharedRecordModel(
        id: 'MED-T5N8R',
        sharedWith: 'St. Mary\'s Hospital',
        createdDate: DateTime(2026, 2, 1),
        expiresDate: DateTime(2026, 4, 15),
        accessedCount: 2,
        sharedRecords: ['ECG Report', 'Blood Pressure Monitor'],
      ),
      SharedRecordModel(
        id: 'MED-P9Q3W',
        sharedWith: 'Dr. Michael Chen',
        createdDate: DateTime(2026, 2, 5),
        expiresDate: DateTime(2026, 5, 1),
        accessedCount: 7,
        sharedRecords: ['Ultrasound', 'CT Scan', 'Pathology Report'],
      ),
      SharedRecordModel(
        id: 'MED-L2K7H',
        sharedWith: 'Valley Health Clinic',
        createdDate: DateTime(2026, 2, 8),
        expiresDate: DateTime(2026, 3, 20),
        accessedCount: 1,
        sharedRecords: ['Vaccination Records', 'Allergy Test'],
      ),
      SharedRecordModel(
        id: 'MED-F6J4D',
        sharedWith: 'Dr. Emily Rodriguez',
        createdDate: DateTime(2026, 2, 10),
        expiresDate: DateTime(2026, 4, 30),
        accessedCount: 4,
        sharedRecords: ['Cardiology Report', 'Stress Test'],
      ),
      SharedRecordModel(
        id: 'MED-Z8M1Y',
        sharedWith: 'Riverside Medical Group',
        createdDate: DateTime(2026, 2, 12),
        expiresDate: DateTime(2026, 3, 28),
        accessedCount: 0,
        sharedRecords: ['Dental X-Ray', 'Oral Health Report'],
      ),

      // Expired shares (expires in the past)
      SharedRecordModel(
        id: 'MED-K9P3X',
        sharedWith: 'General Hospital',
        createdDate: DateTime(2025, 12, 10),
        expiresDate: DateTime(2026, 1, 20),
        accessedCount: 8,
        sharedRecords: ['ECG Report'],
      ),
      SharedRecordModel(
        id: 'MED-N5R7V',
        sharedWith: 'Dr. James Wilson',
        createdDate: DateTime(2025, 11, 15),
        expiresDate: DateTime(2026, 1, 15),
        accessedCount: 12,
        sharedRecords: ['X-Ray', 'Blood Work', 'Physical Exam'],
      ),
      SharedRecordModel(
        id: 'MED-C3H9B',
        sharedWith: 'Metro Urgent Care',
        createdDate: DateTime(2025, 10, 20),
        expiresDate: DateTime(2025, 12, 30),
        accessedCount: 3,
        sharedRecords: ['Flu Test', 'COVID-19 Test'],
      ),
      SharedRecordModel(
        id: 'MED-Q7S2A',
        sharedWith: 'Dr. Lisa Anderson',
        createdDate: DateTime(2025, 11, 5),
        expiresDate: DateTime(2026, 1, 10),
        accessedCount: 6,
        sharedRecords: ['Dermatology Report', 'Biopsy Results'],
      ),
      SharedRecordModel(
        id: 'MED-W4E8G',
        sharedWith: 'Central Diagnostic Lab',
        createdDate: DateTime(2025, 9, 25),
        expiresDate: DateTime(2025, 11, 30),
        accessedCount: 15,
        sharedRecords: ['Complete Blood Count', 'Metabolic Panel', 'Lipid Panel'],
      ),

      // Manually revoked share (even though not expired by date)
      SharedRecordModel(
        id: 'MED-U1I6K',
        sharedWith: 'Dr. Robert Taylor',
        createdDate: DateTime(2026, 1, 1),
        expiresDate: DateTime(2026, 6, 15), // Future date, but revoked
        accessedCount: 4,
        sharedRecords: ['Orthopedic Consultation', 'MRI Results'],
        isRevoked: true, // Manually revoked
      ),
    ];
  }

  /// Get only active shared records
  static List<SharedRecordModel> getActiveShares() {
    return createSampleRecords().where((record) => record.isActive).toList();
  }

  /// Get only expired/revoked shared records
  static List<SharedRecordModel> getExpiredShares() {
    return createSampleRecords().where((record) => !record.isActive).toList();
  }

  /// Get count of active shares
  static int getActiveSharesCount() {
    return getActiveShares().length;
  }

  /// Get count of expired shares
  static int getExpiredSharesCount() {
    return getExpiredShares().length;
  }
}

