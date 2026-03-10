import 'package:get/get.dart';
import 'package:second/controller/onboarding_controller.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class CustomSlideOnBoarding extends GetView<OnBoardingControllerImp> {
  //final String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;

  const CustomSlideOnBoarding({
    super.key,
    //this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.pink.shade100,
          image: DecorationImage(
            image: AssetImage(onBoardingList[i].image!,),
            fit: BoxFit.cover, // لتغطية المساحة كاملة
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: onBoardingList[i].image! == null
            ? const Center(
                child: Icon(Icons.image, size: 50, color: Colors.grey),
              )
            : null,
      ),
    ); // لا حاجة لـ child عند وجود صورة
  }
}
    /*
    
    PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: UpDownEdgeClipper(),
                  child: Image.asset(
                    onBoardingList[i].image!,
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              onBoardingList[i].body!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
 const Text('أهلاً بك!',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      const SizedBox(height: 16),
                      const Text(
                        'ابدأ رحلتك التعليمية بأسلوب تفاعلي وممتع، واكتشف ميزات رائعة بانتظارك!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
*/

class UpDownEdgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 40); // نقطة البداية (يمين الحافة العليا مع انحناء لأعلى)
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 40);

    // حافة منحنية للأسفل على اليمين
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width * 0.5,
      size.height,
    );

    // حافة منحنية للأعلى على اليسار
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      0,
      size.height - 40,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}*/
