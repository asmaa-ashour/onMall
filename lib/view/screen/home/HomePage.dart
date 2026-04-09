import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/them_controller.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/view/widget/home/FloorsSection .dart';
import 'package:second/view/widget/home/ads_section.dart';
import 'package:second/view/widget/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    /// 🔥 IMPORTANT
    SizeConfig.init(context);

    double s = SizeConfig.scaleFactor;

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
                        style: AppTextStyles.productName.copyWith(
                            fontSize: AppSizes.appBarTitle * s,
                            // color: Theme.of(context).textTheme.bodyLarge?.color,
                            color: AppColors.primaryPurple),
                      ),
                    ],
                  ),

                  /// 🔹 Theme Button
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
                          iconSize: AppSizes.icon * s,
                          onPressed: () => themeController.toggleTheme(),
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

            const SizedBox(height: AppDimens.small),

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
