// lib/view/widget/onboarding/dotcontroller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/onboarding_controller.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                duration: const Duration(milliseconds: 300),
                width: controller.currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: controller.currentPage == index
                      ? AppColor.prrimaryColor.withOpacity(0.7)
                      : Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}





// import 'package:second/controller/onboarding_controller.dart';
// import 'package:second/core/constant/color.dart';
// import 'package:second/data/datasource/static/static.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomDotControllerOnBoarding extends StatelessWidget {
//   const CustomDotControllerOnBoarding({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //use GetBuilder not GetView because find change on Refresh UI
//     return GetBuilder<OnBoardingControllerImp>(
//       builder: (controller) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ...List.generate(
//             onBoardingList.length,
//             (index) => AnimatedContainer(
//               margin: const EdgeInsets.only(right: 5),
//               duration: const Duration(milliseconds: 900),
//               width: controller.currentPage == index ? 20 : 6,
//               height: 6,
//               decoration: BoxDecoration(
//                 color: AppColor.prrimaryColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
