import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/onboarding_controller.dart';
import 'package:second/data/datasource/static/static.dart';
import 'package:second/view/widget/onboarding/customercontent.dart';
import 'package:second/view/widget/onboarding/customeroverlay.dart';

class OnBoardingSlider extends GetView<OnBoardingControllerImp> {
  const OnBoardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return Stack(
          children: [
            /// IMAGE
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                onBoardingList[i].image!,
                fit: BoxFit.cover,
              ),
            ),

            /// OVERLAY
            const OnBoardingOverlay(),

            /// CONTENT
            OnBoardingContent(
              title: onBoardingList[i].title!,
              body: onBoardingList[i].body!,
            ),
          ],
        );
      },
    );
  }
}
