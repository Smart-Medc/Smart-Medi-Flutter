// models/appointment_schedule_model.dart

enum AppointmentStatus { confirmed, inProgress, completed, cancelled }

class AppointmentScheduleModel {
  final String _time;
  final String _duration;
  final String _patientName;
  final String _appointmentType;
  final AppointmentStatus _status;

  const AppointmentScheduleModel({
    required String time,
    required String duration,
    required String patientName,
    required String appointmentType,
    required AppointmentStatus status,
  })  : _time = time,
        _duration = duration,
        _patientName = patientName,
        _appointmentType = appointmentType,
        _status = status;

  // ── Getters ──────────────────────────────────────────────────────────────

  String get time => _time;

  String get duration => _duration;

  String get patientName => _patientName;

  String get appointmentType => _appointmentType;

  AppointmentStatus get status => _status;
}

// ── Sample data ───────────────────────────────────────────────────────────────

class AppointmentData {
  static const List<AppointmentScheduleModel> dayAppointments = [
    AppointmentScheduleModel(
      time: '09:00',
      duration: '60 min',
      patientName: 'John Smith',
      appointmentType: 'Check-up',
      status: AppointmentStatus.confirmed,
    ),
    AppointmentScheduleModel(
      time: '10:30',
      duration: '30 min',
      patientName: 'Emily Davis',
      appointmentType: 'Follow-up',
      status: AppointmentStatus.confirmed,
    ),
    AppointmentScheduleModel(
      time: '11:00',
      duration: '45 min',
      patientName: 'Michael Brown',
      appointmentType: 'Consultation',
      status: AppointmentStatus.inProgress,
    ),
    AppointmentScheduleModel(
      time: '14:00',
      duration: '60 min',
      patientName: 'Sara Wilson',
      appointmentType: 'Check-up',
      status: AppointmentStatus.confirmed,
    ),
    AppointmentScheduleModel(
      time: '15:30',
      duration: '30 min',
      patientName: 'David Johnson',
      appointmentType: 'Follow-up',
      status: AppointmentStatus.confirmed,
    ),
  ];

  static const Map<String, List<AppointmentScheduleModel>> weekAppointments = {
    'Monday': [
      AppointmentScheduleModel(
        time: '09:00',
        duration: '60 min',
        patientName: 'John Smith',
        appointmentType: 'Check-up',
        status: AppointmentStatus.confirmed,
      ),
      AppointmentScheduleModel(
        time: '10:30',
        duration: '30 min',
        patientName: 'Emily Davis',
        appointmentType: 'Follow-up',
        status: AppointmentStatus.confirmed,
      ),
    ],
    'Tuesday': [
      AppointmentScheduleModel(
        time: '09:00',
        duration: '60 min',
        patientName: 'John Smith',
        appointmentType: 'Check-up',
        status: AppointmentStatus.confirmed,
      ),
      AppointmentScheduleModel(
        time: '10:30',
        duration: '30 min',
        patientName: 'Emily Davis',
        appointmentType: 'Follow-up',
        status: AppointmentStatus.confirmed,
      ),
    ],
    'Wednesday': [
      AppointmentScheduleModel(
        time: '09:00',
        duration: '60 min',
        patientName: 'John Smith',
        appointmentType: 'Check-up',
        status: AppointmentStatus.confirmed,
      ),
      AppointmentScheduleModel(
        time: '10:30',
        duration: '30 min',
        patientName: 'Emily Davis',
        appointmentType: 'Follow-up',
        status: AppointmentStatus.confirmed,
      ),
    ],
    'Thursday': [
      AppointmentScheduleModel(
        time: '09:00',
        duration: '60 min',
        patientName: 'John Smith',
        appointmentType: 'Check-up',
        status: AppointmentStatus.confirmed,
      ),
      AppointmentScheduleModel(
        time: '10:30',
        duration: '30 min',
        patientName: 'Emily Davis',
        appointmentType: 'Follow-up',
        status: AppointmentStatus.confirmed,
      ),
    ],
    'Friday': [
      AppointmentScheduleModel(
        time: '09:00',
        duration: '60 min',
        patientName: 'John Smith',
        appointmentType: 'Check-up',
        status: AppointmentStatus.confirmed,
      ),
      AppointmentScheduleModel(
        time: '10:30',
        duration: '30 min',
        patientName: 'Emily Davis',
        appointmentType: 'Follow-up',
        status: AppointmentStatus.confirmed,
      ),
    ],
  };
}
