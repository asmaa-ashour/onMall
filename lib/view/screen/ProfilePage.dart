import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("personal_profile".tr,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.prrimaryColor)),
        ),
        body: const Center(
          child: Text("Profile"),
        ));
  }
}
