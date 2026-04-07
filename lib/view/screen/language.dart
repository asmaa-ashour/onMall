import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/core/localization/changelocal.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // 🔹 init scale factor

    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND IMAGE
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              ImageAsset.f4,
              fit: BoxFit.cover,
            ),
          ),

          /// OVERLAY
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          /// CONTENT
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 1),

                /// ICON
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                  ),
                  padding:
                      EdgeInsets.all(AppDimens.large * SizeConfig.scaleFactor),
                  child: Icon(
                    Icons.language,
                    size: 60 * SizeConfig.scaleFactor,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),

                SizedBox(height: 30 * SizeConfig.scaleFactor),

                /// MAIN TEXT
                Text(
                  'choose_language'.tr,
                  style: TextStyle(
                    fontSize: 28 * SizeConfig.scaleFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

<<<<<<< HEAD
                const SizedBox(height: 15),

                Text(
                  'select_preferred_language'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),

=======
>>>>>>> origin/feature/store_and_product
                const Spacer(flex: 1),

                /// LANGUAGE CARDS
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimens.xLarge * SizeConfig.scaleFactor),
                  child: Column(
                    children: [
                      _buildLanguageCard(
                        flag: '🇺🇸',
                        language: 'English',
                        subtitle: 'الإنجليزية',
                        onTap: () {
                          controller.ChangeLocal("en");
                          Get.offNamed(AppRoute.lang);
                        },
                      ),
                      SizedBox(height: 15 * SizeConfig.scaleFactor),
                      _buildLanguageCard(
                        flag: '🇸🇦',
                        language: 'العربية',
                        subtitle: 'Arabic',
                        onTap: () {
                          controller.ChangeLocal("ar");
                          Get.offNamed(AppRoute.lang);
                        },
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageCard({
    required String flag,
    required String language,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimens.medium * SizeConfig.scaleFactor,
            horizontal: AppDimens.large * SizeConfig.scaleFactor,
          ),
          child: Row(
            children: [
              /// FLAG
              Text(
                flag,
                style: TextStyle(fontSize: 35 * SizeConfig.scaleFactor),
              ),
              SizedBox(width: 15 * SizeConfig.scaleFactor),

              /// TEXTS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language,
                      style: TextStyle(
                        fontSize: 18 * SizeConfig.scaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13 * SizeConfig.scaleFactor,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),

              /// ARROW
              Icon(
                Icons.arrow_forward_ios,
                size: 20 * SizeConfig.scaleFactor,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
