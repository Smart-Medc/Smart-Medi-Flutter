class ResetPasswordRequest {
  ResetPasswordRequest({
    required this.email,
    required this.newPassword,
    required this.confirmPassword,
    required this.code,
  });

  final String email;
  final String newPassword;
  final String confirmPassword;
  final String code;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'newPassword': newPassword,
      'confirmNewPassword': confirmPassword,
      'otpCode': code,
    };
  }
}
