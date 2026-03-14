import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/onboarding_controller.dart';
import 'package:second/view/widget/onboarding/custumbutton.dart';
import 'package:second/view/widget/onboarding/dotcontroller.dart';
import 'package:second/view/widget/responcive_size.dart';

class OnBoardingContent extends GetView<OnBoardingControllerImp> {
  final String title;
  final String body;

  const OnBoardingContent({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 60,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// TITLE
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            /// BODY
            Text(
              body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 35),

            /// DOTS
            const CustomDotControllerOnBoarding(),

            const SizedBox(height: 25),

            /// BUTTON
            ///
            GetBuilder<OnBoardingControllerImp>(
              builder: (controller) {
                return CustomButtonOnBoarding(
                  title: controller.currentPage == 2 ? "Get Started" : "Next",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
