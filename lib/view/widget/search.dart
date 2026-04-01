import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/them_controller.dart';
import 'package:second/core/constant/color.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.prrimaryColor,
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
    );
  }
}
