import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/setting_controller.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/view/widget/setting.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingPageControllerImp controller = Get.put(SettingPageControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("setting".tr,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple)),
      ),
      body: SizedBox(
        height: 763,
        child: ListView(
          children: [
            Stack(children: [
              Column(
                children: [
                  RowSettingWidget(
                    icon: Icons.person,
                    text: "personal_profile".tr,
                    onTap: () {
                      controller.goToPersonalProfile();
                    },
                  ),

                  // RowSettingWidget(
                  //   icon: Icons.logout,
                  //   text: "Log out",
                  //   onTap: () {
                  //     controller.logoutButton();
                  //   },
                  // ),
                  RowSettingWidget(
                    icon: Icons.edit,
                    text: "edit_personal_profile".tr,
                    onTap: () {
                      controller.goToEditPersonalProfile();
                    },
                  ),
                  RowSettingWidget(
                    icon: Icons.language,
                    text: "choose_language".tr,
                    onTap: () {
                      controller.goToLanguage();
                    },
                  ),
                  // RowSettingWidget(
                  //   icon: Icons.dark_mode_sharp,
                  //   text: "Changh them",
                  //   onTap: () {
                  //     controller.changhThem();
                  //   },
                  // ),
                  // RowSettingWidget(
                  //   icon: Icons.delete,
                  //   text: "Delet account",
                  //   onTap: () {
                  //     controller.deletAccountButton();
                  //   },
                  // ),
                  RowSettingWidget(
                    icon: Icons.notifications,
                    text: "notification".tr,
                    onTap: () {
                      controller.goToNotification();
                    },
                  ),

                  RowSettingWidget(
                    icon: Icons.wallet,
                    text: "charging_balance".tr,
                    onTap: () {
                      controller.goToChargingPage();
                    },
                  ),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
