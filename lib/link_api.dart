class AppLink {
  static const String serverLink = "http://72.62.42.213:8010/api";

  // =============================Auth=====================//
  static const String signUp = "$serverLink/register";
  static const String login = "$serverLink/login";
  static const String test = "$serverLink/test";
  static const String area = "$serverLink/areasInFloor/";
  static const String floors = "$serverLink/floors";
  static const String logout = "$serverLink/logout";
  static const String resend = "$serverLink/resend";
  static const String verifycodessignup = "$serverLink/verify-otp";
  static const String notifications = "$serverLink/notifications";

  //===================== images ===========================back
  static const String imagestatic = "http://192.168.1.110:8000/";

  static const String imagecategories =
      "$imagestatic/storage/complaints_photos/";

  static const String imageitemes = "$imagestatic/images/category";
}
