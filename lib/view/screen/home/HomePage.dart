import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/theme_dark.dart';
import 'package:second/core/constant/app_constants.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "Find your store",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Obx(() => Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
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
                                ? Colors.amber
                                : AppColor.prrimaryColor,
                          ),
                          tooltip: themeController.isDarkMode.value
                              ? 'الوضع الفاتح'
                              : 'الوضع الداكن',
                        ),
                      )),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.prrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search ...",
                    prefixIcon:
                        Icon(Icons.search), // استخدم prefixIcon بدل icon
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
            // 🏢 FLOORS TITLE

            // 🔥 ADS
            const AdsSection(),

            const SizedBox(height: 30),

            // const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Mall Floors",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 💎 FLOORS CARDS
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.9, // 90% من عرض الشاشة
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
  // // 💡 Category Widget
  // static Widget _categoryItem(String title, IconData icon) {
  //   return Container(
  //     width: 100,
  //     margin: const EdgeInsets.only(left: 16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(15),
  //       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(icon, size: 30),
  //         const SizedBox(height: 8),
  //         Text(title),
  //       ],
  //     ),
  //   );
  // }

