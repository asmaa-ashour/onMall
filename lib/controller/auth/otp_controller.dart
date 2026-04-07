import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/data/datasource/remote/otp_data.dart';

class OtpController extends GetxController {

  final OtpData otpData = OtpData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  bool isVerified = false;
  bool canResend = true;
bool isResending = false;
int resendSeconds = 30;
  TextEditingController otpController = TextEditingController();

  final String email;

  OtpController(this.email);

Future<void> verifyOtp() async {
  if (otpController.text.isEmpty) {
    Get.snackbar("Error", "Enter OTP");
    return;
  }

  /// ✅ تحقق من طول الكود
  if (otpController.text.length != 6) {
    Get.snackbar("Error", "OTP must be 6 digits");
    return;
  }

  statusRequest = StatusRequest.loading;
  update();

  var response = await otpData.verifyOtp(email, otpController.text);

  if (response is StatusRequest) {
    statusRequest = response;
    isVerified = false;

    /// ❌ امسح الحقل
    otpController.clear();

  } else if (response is Map<String, dynamic>) {
    String message = response['message'] ?? "";

    if (message.contains("verified") || message.contains("success")) {
      isVerified = true;
      statusRequest = StatusRequest.success;

      Get.snackbar("Success", message);

    } else {
      isVerified = false;
      statusRequest = StatusRequest.failure;

      /// ❌ امسح الحقل
      otpController.clear();

      Get.snackbar("Error", message);
    }
  } else {
    statusRequest = StatusRequest.failure;
    isVerified = false;

    otpController.clear();

    Get.snackbar("Error", "Invalid OTP");
  }

  update();
}
  /// دالة إعادة إرسال OTP
 Future<void> resendOtp() async {
  if (!canResend) return;

  canResend = false;
  isResending = true;
  resendSeconds = 30;
  update();

  await otpData.resendOtp(email);

  isResending = false;

  /// ⏱️ تايمر 30 ثانية
  Future.doWhile(() async {
    await Future.delayed(const Duration(seconds: 1));
    resendSeconds--;

    if (resendSeconds <= 0) {
      canResend = true;
      update();
      return false;
    }

    update();
    return true;
  });
}
}