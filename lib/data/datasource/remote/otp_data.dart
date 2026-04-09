import '../../../core/class/crud.dart';
import '../../../link_api.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OtpData {
  Crud crud;
  OtpData(this.crud);

  /// تحقق OTP
  verifyOtp(String email, String otp) async {
    var response = await crud.postData(
      AppLink.verifycodessignup,
      {
        "email": email,
        "otp": otp,
      },
      "",
    );

    return response.fold((l) => l, (r) => r);
  }

  /// إعادة إرسال OTP
  resendOtp(String email) async {
    var response = await crud.postData(
      AppLink.resendOtp, // تأكد أنه معرف في link_api.dart
      {"email": email},
      "",
    );

    response.fold(
      (l) {
        Get.snackbar(
          "Error",
          "Failed to resend OTP",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
        );
      },
      (r) {
        if (r is Map<String, dynamic> && r['message'] != null) {
          Get.snackbar(
            "Info",
            r['message'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue.withOpacity(0.7),
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            "Failed to resend OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white,
          );
        }
      },
    );
  }
}
