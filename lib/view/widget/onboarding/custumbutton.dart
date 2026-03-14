import 'package:second/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/view/widget/responcive_size.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  final String title;

  const CustomButtonOnBoarding({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    return SizedBox(
      width: double.infinity,
      height: responsive.hp(6),
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColor.prrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
