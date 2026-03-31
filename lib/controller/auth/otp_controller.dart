import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/data/datasource/remote/otp_data.dart';

class OtpController extends GetxController {
  OtpData otpData = OtpData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController otpController = TextEditingController();

  String email;

  OtpController(this.email);

  verifyOtp() async {
    if (otpController.text.isEmpty) {
      Get.snackbar("Error", "Enter OTP");
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    var response = await otpData.verifyOtp(email, otpController.text);

    statusRequest =
        response is StatusRequest ? response : StatusRequest.success;

    if (statusRequest == StatusRequest.success) {
      Get.snackbar("Success", "Account verified");

      /// 🔥 بعد التفعيل
      // Get.offAllNamed("/home");
    } else {
      Get.snackbar("Error", "Invalid OTP");
    }

    update();
  }
}
