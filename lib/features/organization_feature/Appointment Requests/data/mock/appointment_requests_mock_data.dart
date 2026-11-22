import 'package:smart_medi/features/organization_feature/Appointment%20Requests/data/models/appointment_request_model.dart';

const List<AppointmentSummaryModel> appointmentSummaryItems = [
  AppointmentSummaryModel(
    title: 'Pending Review',
    value: '8',
    type: AppointmentSummaryType.pending,
  ),
  AppointmentSummaryModel(
    title: 'Accepted This Month',
    value: '142',
    type: AppointmentSummaryType.accepted,
  ),
  AppointmentSummaryModel(
    title: 'Rejected This Month',
    value: '12',
    type: AppointmentSummaryType.rejected,
  ),
];

const List<AppointmentRequestModel> appointmentRequests = [
  AppointmentRequestModel(
    patientName: 'Emma Thompson',
    status: 'Pending',
    date: '3/25/2024',
    time: '10:00 AM',
    recordsShared: '2 Records Shared',
    reason: 'Annual Physical Examination',
    requestedAgo: 'Requested 2 hours ago',
  ),
  AppointmentRequestModel(
    patientName: 'James Wilson',
    status: 'Pending',
    date: '3/26/2024',
    time: '02:30 PM',
    recordsShared: '2 Records Shared',
    reason: 'Follow-up Consultation',
    requestedAgo: 'Requested 5 hours ago',
  ),
  AppointmentRequestModel(
    patientName: 'Sarah Martinez',
    status: 'Pending',
    date: '3/27/2024',
    time: '11:00 AM',
    recordsShared: '1 Record Shared',
    reason: 'Lab Results Review',
    requestedAgo: 'Requested 1 day ago',
  ),
];
