import 'appointment_model.dart';

class DummyAppointments {
  static List<AppointmentModel> dummyAppointments = [
    const AppointmentModel(
      clinicName: 'City Medical Center',
      doctorName: 'Dr. John Doe',
      specialty: 'General Checkup',
      date: '2023-10-25',
      time: '10:00 AM',
      visitType: 'In-person',
      address: '123 Main St, Downtown',
      status: 'Confirmed',
    ),
    const AppointmentModel(
      clinicName: 'Heart Center',
      doctorName: 'Dr. Jane Smith',
      specialty: 'Cardiology',
      date: '2023-10-20',
      time: '02:30 PM',
      visitType: 'Online',
      address: '456 Cardiac Way',
      status: 'Confirmed',
    ),
    // const AppointmentModel(
    //   clinicName: 'Skin Care Unit',
    //   doctorName: 'Dr. Alan Brown',
    //   specialty: 'Dermatology',
    //   date: '2023-10-15',
    //   time: '11:15 AM',
    //   visitType: 'In-person',
    //   address: '789 Skin Blvd',
    //   status: 'Cancelled',
    // ),
    // const AppointmentModel(
    //   clinicName: "Children's Wing",
    //   doctorName: 'Dr. Sarah Wilson',
    //   specialty: 'Pediatrics',
    //   date: '2023-11-05',
    //   time: '09:00 AM',
    //   visitType: 'In-person',
    //   address: '101 Kids Road',
    //   status: 'Pending',
    // ),
  ];
}
