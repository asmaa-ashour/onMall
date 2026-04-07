import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:second/controller/them_controller.dart';
<<<<<<< HEAD
import 'package:second/core/constant/color.dart';

import 'package:second/view/widget/home/FloorsSection%20.dart';
=======
import 'package:second/core/constant/app_constants.dart';
import 'package:second/view/widget/home/FloorsSection .dart';
>>>>>>> origin/feature/store_and_product
import 'package:second/view/widget/home/ads_section.dart';
import 'package:second/view/widget/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

<<<<<<< HEAD
=======
    /// 🔥 IMPORTANT
    SizeConfig.init(context);

    double s = SizeConfig.scaleFactor;

>>>>>>> origin/feature/store_and_product
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            /// 🔥 HEADER
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.medium,
                vertical: AppDimens.medium,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// 🔹 Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppDimens.small),
                      Text(
                        "find_store".tr,
<<<<<<< HEAD
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).textTheme.bodyLarge?.color,
                        ),
=======
                        style: AppTextStyles.productName.copyWith(
                            fontSize: AppSizes.appBarTitle * s,
                            // color: Theme.of(context).textTheme.bodyLarge?.color,
                            color: AppColors.primaryPurple),
>>>>>>> origin/feature/store_and_product
                      ),
                    ],
                  ),

<<<<<<< HEAD
=======
                  /// 🔹 Theme Button
>>>>>>> origin/feature/store_and_product
                  Obx(() => Container(
                        padding: const EdgeInsets.all(AppDimens.verysmall),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: AppDimens.small.w,
                            )
                          ],
                        ),
                        child: IconButton(
<<<<<<< HEAD
                          onPressed: () =>
                              themeController.toggleTheme(),
=======
                          iconSize: AppSizes.icon * s,
                          onPressed: () => themeController.toggleTheme(),
>>>>>>> origin/feature/store_and_product
                          icon: Icon(
                            themeController.isDarkMode.value
                                ? Icons.light_mode
                                : Icons.dark_mode,
                            color: themeController.isDarkMode.value

                                ? Colors.amber
                                : AppColors.primaryPurple,
                          ),
                        ),
                      )),
                ],
              ),
            ),

<<<<<<< HEAD
            const SizedBox(height: 20),
// <<<<<<< HEAD

//             // 🔍 SEARCH BAR
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: themeController.isDarkMode.value
//                           ? Colors.white10
//                           : Colors.black12,
//                       blurRadius: 10,
//                     )
//                   ],
//                 ),
//                 child: TextField(
//                   style: TextStyle(
//                     color: Theme.of(context).textTheme.bodyLarge?.color,
//                   ),
//                   decoration: InputDecoration(
//                     hintText: "search".tr,
//                     hintStyle: TextStyle(
//                       color: themeController.isDarkMode.value
//                           ? Colors.grey[400]
//                           : Colors.grey[600],
//                     ),
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: themeController.isDarkMode.value
//                           ? Colors.grey[400]
//                           : Colors.grey[600],
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: const EdgeInsets.symmetric(
//                       vertical: 15,
//                       horizontal: 15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
// =======
            const Search(),
=======
            const SizedBox(height: AppDimens.small),
>>>>>>> origin/feature/store_and_product

            /// 🔍 SEARCH
            // const Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: AppDimens.small,
            //   ),
            // child:
            Search(),
            // ),

            const SizedBox(height: AppDimens.large),

            /// 🔥 ADS
            // const Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: AppDimens.verysmall,
            //   ),
            // child:
            const AdsSection(),
            // ),

            const SizedBox(height: AppDimens.medium),

            /// 🔥 FLOORS TITLE
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.medium,
              ),
              child: Text(
                "mall_floors".tr,
                style: AppTextStyles.productName.copyWith(
                    fontSize: AppSizes.appBarTitle * s,
                    // color: Theme.of(context).textTheme.bodyLarge?.color,
                    color: AppColors.primaryPurple),
              ),
            ),

            const SizedBox(height: AppDimens.medium),

            /// 💎 FLOORS
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.medium,
              ),
              child: SizedBox(
                width: double.infinity,
                child: FloorsSection(),
              ),
            ),

            const SizedBox(height: AppDimens.xLarge),
          ],
        ),
      ),
    );
  }
}