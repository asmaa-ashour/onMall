import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/onboarding_controller.dart';
import 'package:second/view/widget/onboarding/customslide.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());

    return const Scaffold(
      body: OnBoardingSlider(),
    );
  }
}
