class SignUpRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final String dateOfBirth;
  final String gender;
  final String emergencyContactName;
  final String emergencyContactPhone;
  final String emergencyContactRelationship;

  SignUpRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.dateOfBirth,
    required this.gender,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    required this.emergencyContactRelationship,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'emergencyContactName': emergencyContactName,
      'emergencyContactPhone': emergencyContactPhone,
      'emergencyContactRelationship': emergencyContactRelationship,
    };
  }

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    return SignUpRequestModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      emergencyContactName: json['emergencyContactName'] as String,
      emergencyContactPhone: json['emergencyContactPhone'] as String,
      emergencyContactRelationship: json['emergencyContactRelationship'] as String,
    );
  }
}

