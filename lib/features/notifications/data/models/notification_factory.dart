import 'package:smart_medi/features/notifications/data/models/notification_model.dart';

class NotificationFactory {
  // Create appointment reminder notification
  static NotificationModel createAppointmentReminder({
    required String id,
    required String doctorName,
    required DateTime appointmentTime,
    required DateTime timestamp,
    bool isRead = false,
    bool isNew = false,
  }) {
    return NotificationModel(
      id: id,
      type: NotificationType.appointment,
      title: 'Appointment Reminder',
      message:
          'You have an appointment with $doctorName tomorrow at ${_formatTime(appointmentTime)}',
      timestamp: timestamp,
      isRead: isRead,
    );
  }

  // Create medication reminder notification
  static NotificationModel createMedicationReminder({
    required String id,
    required String medicationName,
    required String dosage,
    required DateTime timestamp,
    bool isRead = false,
    bool isNew = false,
  }) {
    return NotificationModel(
      id: id,
      type: NotificationType.medication,
      title: 'Medication Reminder',
      message: 'Time to take your $medicationName ($dosage)',
      timestamp: timestamp,
      isRead: isRead,
    );
  }

  // Create AI health insight notification
  static NotificationModel createAIHealthInsight({
    required String id,
    required String insightMessage,
    required DateTime timestamp,
    bool isRead = false,
  }) {
    return NotificationModel(
      id: id,
      type: NotificationType.aiInsight,
      title: 'AI Health Insight',
      message: insightMessage,
      timestamp: timestamp,
      isRead: isRead,
    );
  }

  // Helper method to format time
  static String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }

  // Get sample notifications for testing
  static List<NotificationModel> getSampleNotifications() {
    final now = DateTime.now();

    return [
      createAppointmentReminder(
        id: '1',
        doctorName: 'Dr. Sarah Johnson',
        appointmentTime: DateTime(now.year, now.month, now.day + 1, 10, 0),
        timestamp: now.subtract(const Duration(hours: 1)),
        isRead: false,
      ),createAppointmentReminder(
        id: '1',
        doctorName: 'Dr. Sarah Johnson',
        appointmentTime: DateTime(now.year, now.month, now.day + 1, 10, 0),
        timestamp: now.subtract(const Duration(hours: 1)),
        isRead: false,
      ),createAppointmentReminder(
        id: '1',
        doctorName: 'Dr. Sarah Johnson',
        appointmentTime: DateTime(now.year, now.month, now.day + 1, 10, 0),
        timestamp: now.subtract(const Duration(hours: 1)),
        isRead: false,
      ),createAppointmentReminder(
        id: '1',
        doctorName: 'Dr. Sarah Johnson',
        appointmentTime: DateTime(now.year, now.month, now.day + 1, 10, 0),
        timestamp: now.subtract(const Duration(hours: 1)),
        isRead: true,
      ),createAppointmentReminder(
        id: '1',
        doctorName: 'Dr. Sarah Johnson',
        appointmentTime: DateTime(now.year, now.month, now.day + 1, 10, 0),
        timestamp: now.subtract(const Duration(hours: 1)),
        isRead: false,
      ),
      createMedicationReminder(
        id: '2',
        medicationName: 'Metformin',
        dosage: '500mg',
        timestamp: now.subtract(const Duration(hours: 2)),
        isRead: false,
      ),createMedicationReminder(
        id: '2',
        medicationName: 'Metformin',
        dosage: '500mg',
        timestamp: now.subtract(const Duration(hours: 2)),
        isRead: true,
      ),createMedicationReminder(
        id: '2',
        medicationName: 'Metformin',
        dosage: '500mg',
        timestamp: now.subtract(const Duration(hours: 2)),
        isRead: false,
      ),createMedicationReminder(
        id: '2',
        medicationName: 'Metformin',
        dosage: '500mg',
        timestamp: now.subtract(const Duration(hours: 2)),
        isRead: false,
      ),createMedicationReminder(
        id: '2',
        medicationName: 'Metformin',
        dosage: '500mg',
        timestamp: now.subtract(const Duration(hours: 2)),
        isRead: false,
      ),
      createAIHealthInsight(
        id: '3',
        insightMessage:
            'MediGemma has detected a pattern in your journal entries. Review the insights.',
        timestamp: now.subtract(const Duration(hours: 5)),
        isRead: false,
      ),createAIHealthInsight(
        id: '3',
        insightMessage:
            'MediGemma has detected a pattern in your journal entries. Review the insights.',
        timestamp: now.subtract(const Duration(hours: 5)),
        isRead: true,
      ),createAIHealthInsight(
        id: '3',
        insightMessage:
            'MediGemma has detected a pattern in your journal entries. Review the insights.',
        timestamp: now.subtract(const Duration(hours: 5)),
        isRead: true,
      ),createAIHealthInsight(
        id: '3',
        insightMessage:
            'MediGemma has detected a pattern in your journal entries. Review the insights.',
        timestamp: now.subtract(const Duration(hours: 5)),
        isRead: true,
      ),

    ];
  }
}

