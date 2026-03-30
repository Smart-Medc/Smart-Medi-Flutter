class AppointmentModel {
  final String clinicName;
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String visitType;
  final String address;
  final String status;
  //final VoidCallback? onViewDetails;
 // final VoidCallback? onReschedule;
  //final VoidCallback? onCancel;

  const AppointmentModel({
    required this.clinicName,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.visitType,
    required this.address,
    required this.status,
   // this.onViewDetails,
    //this.onReschedule,
    //this.onCancel,
  });
}