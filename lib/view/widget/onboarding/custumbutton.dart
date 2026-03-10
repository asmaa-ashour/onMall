import 'package:second/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/app_constants.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.large),
      height: AppDimens.buttonHeight,
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          ),
          elevation: 5,
        ),
        child: const Text(
          'Continue',
          style: AppTextStyles.buttonText,
        ),
      ),
    );
  }
}
    /*AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      //  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
      width: 300,
      // double.infinity,
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        child: const Text(
          'Continue',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
*/