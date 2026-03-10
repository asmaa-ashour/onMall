import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/onboarding_controller.dart';
import 'package:second/view/widget/onboarding/customslide.dart';
import 'package:second/view/widget/onboarding/custumbutton.dart';
import 'package:second/view/widget/onboarding/dotcontroller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // التأكد من وجود الـ controller
    final controller = Get.lazyPut(() => OnBoardingControllerImp());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white, Colors.grey
              // Color(0xFF8E2DE2), Color(0xFF4A00E0)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: const CustomSlideOnBoarding(
                    width: double.infinity, height: 20),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomDotControllerOnBoarding(),
                    const CustomButtonOnBoarding(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
