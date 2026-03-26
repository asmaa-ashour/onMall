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

  signup() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await authData.signup(
      name.text,
      email.text,
      password.text,
      phone.text,
    );

    statusRequest =
        response is StatusRequest ? response : StatusRequest.success;

    if (statusRequest == StatusRequest.success) {
      String token = response['token'];

      myServices.sharedPreferences.setString("token", token);
      myServices.sharedPreferences
          .setString("user", response['user'].toString());

      Get.snackbar("Success", response['message']);
    } else {
      Get.snackbar("Error", "Signup failed");
    }

    update();
  }
}
