import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  // Keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _accessTokenExpiresAtKey = 'access_token_expires_at';
  static const String _refreshTokenExpiresAtKey = 'refresh_token_expires_at';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';
  static const String _userTypeKey = 'user_type';
  static const String _userNameKey = 'user_name';
  static const String _patientIdKey = 'patient_id';

  // Save access token
  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  // Get access token
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }
  
  // Save refresh token
  static Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // Get refresh token
  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }
  
  // Save token expiration date
  static Future<void> saveAccessTokenExpiresAt(String expiresAt) async {
    await _storage.write(key: _accessTokenExpiresAtKey, value: expiresAt);
  }

  // Get token expiration date
  static Future<String?> getAccessTokenExpiresAt() async {
    return await _storage.read(key: _accessTokenExpiresAtKey);
  }

  // Save refresh token expiration date
  static Future<void> saveRefreshTokenExpiresAt(String expiresAt) async {
    await _storage.write(key: _refreshTokenExpiresAtKey, value: expiresAt);
  }

  // Get refresh token expiration date
  static Future<String?> getRefreshTokenExpiresAt() async {
    return await _storage.read(key: _refreshTokenExpiresAtKey);
  }

  // Save user ID
  static Future<void> saveUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  // Get user ID
  static Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  // Save user email
  static Future<void> saveUserEmail(String email) async {
    await _storage.write(key: _userEmailKey, value: email);
  }

  // Get user email
  static Future<String?> getUserEmail() async {
    return await _storage.read(key: _userEmailKey);
  }

  // Save user type
  static Future<void> saveUserType(String userType) async {
    await _storage.write(key: _userTypeKey, value: userType);
  }

  // Get user type
  static Future<String?> getUserType() async {
    return await _storage.read(key: _userTypeKey);
  }

  // Save user name
  static Future<void> saveUserName(String userName) async {
    await _storage.write(key: _userNameKey, value: userName);
  }

  // Get user name
  static Future<String?> getUserName() async {
    return await _storage.read(key: _userNameKey);
  }

  // Save patient ID
  static Future<void> savePatientId(String patientId) async {
    await _storage.write(key: _patientIdKey, value: patientId);
  }

  // Get patient ID
  static Future<String?> getPatientId() async {
    return await _storage.read(key: _patientIdKey);
  }

  // Save all login data at once
  static Future<void> saveLoginData({
    required String accessToken,
    required String accessTokenExpiresAt,
    required String refreshToken,
    required String refreshTokenExpiresAt,
    required String userId,
    required String userEmail,
    required String userType,
    required String userName,
    String? patientId,
  }) async {
    await Future.wait([
      saveAccessToken(accessToken),
      saveAccessTokenExpiresAt(accessTokenExpiresAt),
      saveRefreshToken(refreshToken),
      saveRefreshTokenExpiresAt(refreshTokenExpiresAt),
      saveUserId(userId),
      saveUserEmail(userEmail),
      saveUserType(userType),
      saveUserName(userName),
      if(patientId != null ) savePatientId(patientId),
    ]);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  // Clear all stored data (logout)
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  // Clear only auth tokens
  static Future<void> clearAuthTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _accessTokenExpiresAtKey),
    ]);
  }
}

