class LoginResponse {

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: LoginData.fromJson(json['data'] ?? {}),
    );
  }
  final bool success;
  final String message;
  final LoginData data;

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class LoginData {

  LoginData({
    required this.accessToken,
    required this.accessTokenExpiresAt,
    required this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      accessToken: json['accessToken'] ?? '',
      accessTokenExpiresAt: json['accessTokenExpiresAt'] ?? '',
      user: UserData.fromJson(json['user'] ?? {}),
    );
  }
  final String accessToken;
  final String accessTokenExpiresAt;
  final UserData user;

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'accessTokenExpiresAt': accessTokenExpiresAt,
      'user': user.toJson(),
    };
  }
}

class UserData {

  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.profileImageUrl,
    required this.userType,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.roles,
    this.patientId,
    this.organizationId,
    this.organizationName,
    this.verificationStatus,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      fullName: json['fullName'] ?? '',
      profileImageUrl: json['profileImageUrl'],
      userType: json['userType'] ?? '',
      isEmailVerified: json['isEmailVerified'] ?? false,
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      roles: (json['roles'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      patientId: json['patientId'],
      organizationId: json['organizationId'],
      organizationName: json['organizationName'],
      verificationStatus: json['verificationStatus'],
    );
  }
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String fullName;
  final String? profileImageUrl;
  final String userType;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final List<String> roles;
  final String? patientId;
  final String? organizationId;
  final String? organizationName;
  final String? verificationStatus;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'profileImageUrl': profileImageUrl,
      'userType': userType,
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'roles': roles,
      'patientId': patientId,
      'organizationId': organizationId,
      'organizationName': organizationName,
      'verificationStatus': verificationStatus,
    };
  }
}

