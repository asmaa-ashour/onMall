import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/them_controller.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/view/widget/home/FloorsSection%20.dart';
import 'package:second/view/widget/home/ads_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            // 🔥 HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        "find_store".tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    ],
                  ),

                  // 🌙 زر Dark Mode
                  Obx(() => Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: themeController.isDarkMode.value
                                  ? Colors.white10
                                  : Colors.black12,
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: IconButton(
                          onPressed: () => themeController.toggleTheme(),
                          icon: Icon(
                            themeController.isDarkMode.value
                                ? Icons.light_mode
                                : Icons.dark_mode,
                            color: themeController.isDarkMode.value
                                ? AppColor.sun
                                : AppColor.prrimaryColor,
                          ),
                          tooltip: themeController.isDarkMode.value
                              ? "light_mode".tr
                              : "dark_mode".tr,
                        ),
                      )),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔍 SEARCH BAR - دعم Dark Mode
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: themeController.isDarkMode.value
                          ? Colors.white10
                          : Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: TextField(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  decoration: InputDecoration(
                    hintText: "search".tr,
                    hintStyle: TextStyle(
                      color: themeController.isDarkMode.value
                          ? Colors.grey[400]
                          : Colors.grey[600],
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: themeController.isDarkMode.value
                          ? Colors.grey[400]
                          : Colors.grey[600],
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 🔥 ADS SECTION
            const AdsSection(),

            const SizedBox(height: 30),

            // عنوان Mall Floors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "mall_floors".tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 💎 FLOORS CARDS
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: FloorsSection(),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
