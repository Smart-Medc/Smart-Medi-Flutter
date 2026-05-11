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




// ==========================================
// MODEL: Appointment / Provider Data Models
// ==========================================

class ProviderModel {
  final String name;
  final String type; // e.g., Hospital, Clinic, Individual Doctor
  final double rating;
  final int reviewCount;
  final List<String> specialties;
  final String address;
  final String nextAvailable;
  final String? phone;
  final String? email;
  final String? website;
  final String? description;
  final List<OperatingHour>? operatingHours;
  final List<AffiliatedDoctor>? affiliatedDoctors;

  const ProviderModel({
    required this.name,
    required this.type,
    required this.rating,
    required this.reviewCount,
    required this.specialties,
    required this.address,
    required this.nextAvailable,
    this.phone,
    this.email,
    this.website,
    this.description,
    this.operatingHours,
    this.affiliatedDoctors,
  });
}

class OperatingHour {
  final String day;
  final String hours;
  final bool isClosed;

  const OperatingHour({
    required this.day,
    required this.hours,
    this.isClosed = false,
  });
}

class AffiliatedDoctor {
  final String name;
  final String specialty;
  final double rating;

  const AffiliatedDoctor({
    required this.name,
    required this.specialty,
    required this.rating,
  });
}

// ─── Sample Data ─────────────────────────────────────────────────────────────

final List<ProviderModel> sampleProviders = [
  ProviderModel(
    name: 'City Medical Center',
    type: 'Hospital',
    rating: 4.8,
    reviewCount: 234,
    specialties: ['Cardiology', 'Neurology', 'Surgery'],
    address: '123 Medical Plaza, Downtown',
    nextAvailable: 'Today, 2:00 PM',
    phone: '+1 (555) 123-4567',
    email: 'contact@citymedical.com',
    website: 'www.citymedical.com',
    description:
    'City Medical Center is a leading healthcare facility, dedicated to providing comprehensive medical services with state-of-the-art technology and compassionate care. Our team of experienced physicians and healthcare professionals are committed to excellence in patient care.',
    operatingHours: [
      OperatingHour(day: 'Monday', hours: '8:00 AM – 9:00 PM'),
      OperatingHour(day: 'Tuesday', hours: '8:00 AM – 9:00 PM'),
      OperatingHour(day: 'Wednesday', hours: '8:00 AM – 9:00 PM'),
      OperatingHour(day: 'Thursday', hours: '8:00 AM – 9:00 PM'),
      OperatingHour(day: 'Friday', hours: '8:00 AM – 9:00 PM'),
      OperatingHour(day: 'Saturday', hours: '8:00 AM – 8:00 PM'),
      OperatingHour(day: 'Sunday', hours: 'Closed', isClosed: true),
    ],
    affiliatedDoctors: [
      AffiliatedDoctor(name: 'Dr. Sarah Johnson', specialty: 'Cardiology', rating: 4.9),
      AffiliatedDoctor(name: 'Dr. Michael Chen', specialty: 'Neurology', rating: 4.8),
      AffiliatedDoctor(name: 'Dr. Emily Brown', specialty: 'Surgery', rating: 4.7),
    ],
  ),
  ProviderModel(
    name: 'HealthCare Clinic',
    type: 'Clinic',
    rating: 4.6,
    reviewCount: 189,
    specialties: ['General Practice', 'Pediatrics'],
    address: '456 Health Street, Midtown',
    nextAvailable: 'Tomorrow, 9:00 AM',
  ),
  ProviderModel(
    name: 'Dr. Sarah Johnson',
    type: 'Individual Doctor',
    rating: 4.7,
    reviewCount: 312,
    specialties: ['Cardiology'],
    address: '789 Heart Care Ave, Uptown',
    nextAvailable: 'Mar 26, 10:30 AM',
  ),
];
