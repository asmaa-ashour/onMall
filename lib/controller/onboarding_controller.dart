import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/routs.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;

  final int lastPage = 2; // عدد السلايدات - 1

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  next() {
    if (currentPage == lastPage) {
      Get.offAllNamed(AppRoute.home);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
