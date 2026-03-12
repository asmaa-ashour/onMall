import 'package:get/get.dart';
import 'package:second/controller/onboarding_controller.dart';
import 'package:second/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class CustomSlideOnBoarding extends GetView<OnBoardingControllerImp> {
  final double width;
  final double height;

  const CustomSlideOnBoarding({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Stack(
        children: [
          /// IMAGE
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              onBoardingList[i].image!,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
