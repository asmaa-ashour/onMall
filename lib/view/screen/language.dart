import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/core/localization/changelocal.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND IMAGE (نفس أسلوب onboarding)
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              ImageAsset.f4, // ضعي صورتك الخلفية
              fit: BoxFit.cover,
            ),
          ),

          /// OVERLAY (نفس طبقة التعتيم من onboarding)
          Container(
            color: Colors.black.withOpacity(0.3), // نفس النسبة
          ),

          /// CONTENT
          SafeArea(
            child: Column(
              children: [
                /// مساحة مرنة
                const Spacer(flex: 1),

                /// الأيقونة أو الشعار
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    Icons.language,
                    size: 60,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),

                const SizedBox(height: 30),

                /// النص الرئيسي
                Text(
                  'choose_language'.tr,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 15),

                Text(
                  'select_preferred_language'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),

                const Spacer(flex: 1),

                /// الأزرار بنفس ستايل الـ Onboarding Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      _buildLanguageCard(
                        flag: '🇺🇸',
                        language: 'English',
                        subtitle: 'الإنجليزية',
                        onTap: () {
                          controller.ChangeLocal("en");
                          Get.offNamed(AppRoute.onBoarding);
                        },
                      ),
                      const SizedBox(height: 15),
                      _buildLanguageCard(
                        flag: '🇸🇦',
                        language: 'العربية',
                        subtitle: 'Arabic',
                        onTap: () {
                          controller.ChangeLocal("ar");
                          Get.offNamed(AppRoute.onBoarding);
                        },
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1),

                /// نص سفلي صغير
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'swipe_to_continue'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
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
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            children: [
              /// العلم
              Text(
                flag,
                style: const TextStyle(fontSize: 35),
              ),
              const SizedBox(width: 15),

              /// النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),

              /// السهم
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
