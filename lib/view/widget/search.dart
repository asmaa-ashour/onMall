import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/them_controller.dart';
import 'package:second/core/constant/app_constants.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    /// 🔥 Responsive (فقط للأحجام البصرية)
    double s = SizeConfig.scaleFactor.clamp(0.9, 1.2);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.large, // ❌ بدون scale
      ),
      child: Container(
        height: AppDimens.buttonHeight, // ❌ ثابت
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          boxShadow: [
            BoxShadow(
              color: themeController.isDarkMode.value
                  ? Colors.white10
                  : Colors.black12,
              blurRadius: AppDimens.small,
            )
          ],
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 14 * s, // ✅ responsive
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          decoration: InputDecoration(
            hintText: "search".tr,
            hintStyle: TextStyle(
              fontSize: 14 * s, // ✅ responsive
              color: themeController.isDarkMode.value
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),

            prefixIcon: Icon(
              Icons.search,
              size: AppSizes.icon * s, // ✅ responsive
              color: themeController.isDarkMode.value
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),

            border: InputBorder.none,

            /// ❗ مهم: خلي نفس الـ radius تبع الكونتينر
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius),
              borderSide: BorderSide(
                color: AppColors.primaryPurple,
                width: 2,
              ),
            ),

            /// ❗ لا تكبريه بالـ scale
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppDimens.small,
              horizontal: AppDimens.medium,
            ),
          ),
        ),
      ),
    );
  }
}
