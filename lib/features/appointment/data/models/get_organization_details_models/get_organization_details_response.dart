class OrganizationDetailsResponse {

  OrganizationDetailsResponse({
    required this.id,
    required this.name,
    this.description,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
    required this.doctors,
    required this.operatingHours,
    required this.consultationFees,
  });

  factory OrganizationDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return OrganizationDetailsResponse(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      website: json['website'] ?? '',
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e))
          .toList() ??
          [],
      operatingHours: (json['operatingHours'] as List<dynamic>?)
          ?.map((e) => OperatingHourModel.fromJson(e))
          .toList() ??
          [],
      consultationFees: (json['consultationFees'] as List<dynamic>?)
          ?.map((e) => ConsultationFeeModel.fromJson(e))
          .toList() ??
          [],
    );
  }
  final String id;
  final String name;
  final String? description;
  final String address;
  final String phone;
  final String email;
  final String website;
  final List<DoctorModel> doctors;
  final List<OperatingHourModel> operatingHours;
  final List<ConsultationFeeModel> consultationFees;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'address': address,
    'phone': phone,
    'email': email,
    'website': website,
    'doctors': doctors.map((e) => e.toJson()).toList(),
    'operatingHours':
    operatingHours.map((e) => e.toJson()).toList(),
    'consultationFees':
    consultationFees.map((e) => e.toJson()).toList(),
  };
}

class DoctorModel {

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.photoUrl,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      photoUrl: json['photoUrl'] ?? '',
    );
  }
  final String id;
  final String name;
  final String specialization;
  final double rating;
  final String photoUrl;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'specialization': specialization,
    'rating': rating,
    'photoUrl': photoUrl,
  };
}
class OperatingHourModel {

  OperatingHourModel({
    required this.day,
    required this.hours,
  });

  factory OperatingHourModel.fromJson(Map<String, dynamic> json) {
    return OperatingHourModel(
      day: json['day'] ?? '',
      hours: json['hours'] ?? '',
    );
  }
  final String day;
  final String hours;

  Map<String, dynamic> toJson() => {
    'day': day,
    'hours': hours,
  };
}
class ConsultationFeeModel {

  ConsultationFeeModel({
    required this.type,
    required this.amount,
  });

  factory ConsultationFeeModel.fromJson(Map<String, dynamic> json) {
    return ConsultationFeeModel(
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
    );
  }
  final String type;
  final double amount;

  Map<String, dynamic> toJson() => {
    'type': type,
    'amount': amount,
  };
}