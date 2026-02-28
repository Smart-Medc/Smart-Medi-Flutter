import 'package:smart_medi/core/helpers/secure_storage_helper.dart';

class AuthHelper {
  AuthHelper._();

  /// Check if user is authenticated
  static Future<bool> isAuthenticated() async {
    return await SecureStorageHelper.isLoggedIn();
  }

  /// Get current user's access token
  static Future<String?> getAccessToken() async {
    return await SecureStorageHelper.getAccessToken();
  }

  /// Get current user's ID
  static Future<String?> getCurrentUserId() async {
    return await SecureStorageHelper.getUserId();
  }

  /// Get current user's email
  static Future<String?> getCurrentUserEmail() async {
    return await SecureStorageHelper.getUserEmail();
  }

  /// Get current user's type
  static Future<String?> getCurrentUserType() async {
    return await SecureStorageHelper.getUserType();
  }

  /// Get current user's name
  static Future<String?> getCurrentUserName() async {
    return await SecureStorageHelper.getUserName();
  }

  /// Logout user - clears all stored data
  static Future<void> logout() async {
    await SecureStorageHelper.clearAll();
  }

  /// Check if token is expired
  static Future<bool> isTokenExpired() async {
    final expiresAt = await SecureStorageHelper.getAccessTokenExpiresAt();

    if (expiresAt == null) return true;

    try {
      final expiryDate = DateTime.parse(expiresAt);
      return DateTime.now().isAfter(expiryDate);
    } catch (e) {
      return true;
    }
  }
}

