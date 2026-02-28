class VerifyResetCodeRequest {
  VerifyResetCodeRequest({
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otpCode': code,
    };
  }
}