import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/services/services.dart';
import 'package:second/data/datasource/remote/auth_datda.dart';

class AuthController extends GetxController {
  AuthData authData = AuthData(Get.find());
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

<<<<<<< HEAD
  Future<dynamic> signup() async {  // 👈 dynamic بدلاً من bool
=======
  Future<dynamic> signup() async {
    // 👈 dynamic بدلاً من bool
>>>>>>> feature/store_and_product
    statusRequest = StatusRequest.loading;
    update();

    var response = await authData.signup(
      name.text,
      email.text,
      password.text,
      phone.text,
    );

    print("RESPONSE: $response");

    if (response is StatusRequest) {
      statusRequest = response;
      Get.snackbar("Error", "Server error");
      update();
      return false;
    }

    // ✅ تحقق من نجاح الرد من السيرفر
    if (response is Map<String, dynamic> && response['message'] != null) {
      statusRequest = StatusRequest.success;
      update();
      return response; // 👈 ارجع الـ Map نفسه
    } else {
      statusRequest = StatusRequest.failure;
      Get.snackbar("Error", response['message'] ?? "Signup failed");
      update();
      return false;
    }
  }
}