import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/setting_controller.dart';
import 'package:second/view/widget/setting.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingPageControllerImp controller = Get.put(SettingPageControllerImp());
    return SizedBox(
      height: 763,
      child: ListView(
        children: [
          Stack(children: [
            Column(
              children: [
                RowSettingWidget(
                  icon: Icons.person,
                  text: "PersonalProfile",
                  onTap: () {
                    controller.goToPersonalProfile();
                  },
                ),
                RowSettingWidget(
                  icon: Icons.language,
                  text: "Chosse language",
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
                  text: "  Edit PersonalProfile",
                  onTap: () {
                    controller.goToEditPersonalProfile();
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
                  text: "Notifications",
                ),
                RowSettingWidget(
                  icon: Icons.hotel,
                  text: "Hotel",
                  onTap: () {
                    controller.goToHotelPage();
                  },
                ),
                RowSettingWidget(
                  icon: Icons.restaurant,
                  text: "restaurant",
                  onTap: () {
                    controller.goToResturantPage();
                  },
                ),
                RowSettingWidget(
                  icon: Icons.wallet,
                  text: "charging your balance",
                  onTap: () {
                    controller.goToChargingPage();
                  },
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
