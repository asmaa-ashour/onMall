import 'package:flutter/material.dart';
import 'package:second/core/constant/color.dart';

class OnBoardingOverlay extends StatelessWidget {
  const OnBoardingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// طبقة سوداء خفيفة على كامل الصورة
        Container(
          color: Colors.black.withOpacity(0.15),
        ),

        /// تدرج برغندي يبدأ من منتصف الشاشة
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                AppColor.prrimaryColor.withOpacity(0.6),
                AppColor.thirdColor.withOpacity(0.8),
              ],
              stops: const [
                0.5, // يبدأ من منتصف الشاشة
                0.75,
                1,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
