class ApiEndPoint {
  // Auth
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String refreshToken = "auth/refresh_token";
  static const String forgotPassword = "auth/forgot_password";
  static const String requestOtp = "auth/refresh_otp";
  static const String confirmOtp = "auth/confirm_otp";
  static const String resetPassword = "auth/reset_password";

  // User
  static const String getProfile = "users/me";
  static String updateProfile(String id) => "users/$id";
  static String updateUserAvatar(String id) => "users/$id/avatar";
  static String deleteUserAvatar(String id) => "users/$id/avatar";
  static String updatePassword(String id) => "users/$id/password";
  static String getProfileById(String id) => "users/$id";
  static String requestDeleteAccount(String id) =>
      "users/$id/sendOtpDeleteAccount";
  static String deleteAccount(String id) => "users/$id/deleteAccount";

  // Blood
  static const String blooddonations = "blooddonations";
  static const String blooddonationsOTP = "blooddonations/requestotp";
  static const String bloodRequest = "bloodrequests";
  static const String bloodTransaction = "blooddonations/schedule";

  // Provinces
  static const String provinces = "province/provinces";
  static const String districts = "province/";
  static const String wards = "blooddonations";

  //FAQ
  static const String faq = "Faqs";
  // Notifications
  static const String notifications = "Notifications";
  static const String readAllNotifications = 'Notifications/readAll';
  static String getNotificationDetails(String id) => 'Notifications/$id';
}
