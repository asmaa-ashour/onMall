import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/core/constant/imageassets.dart';

class AdsSection extends StatefulWidget {
  const AdsSection({super.key});

  @override
  State<AdsSection> createState() => _AdsSectionState();
}

class _AdsSectionState extends State<AdsSection> {
  int currentIndex = 0;

  final List<String> ads = [
    ImageAsset.f4,
    ImageAsset.f2,
    ImageAsset.f3,
  ];

  @override
  Widget build(BuildContext context) {
    /// 🔥 Responsive (محدود حتى ما يخرب الشكل)
    double s = SizeConfig.scaleFactor.clamp(0.9, 1.2);

    return Column(
      children: [
        /// 🔥 Slider
        CarouselSlider(
          items: ads.map((image) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimens.small, // ❌ ثابت
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: AppDimens.small,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    /// 🖼 Image
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),

                    /// 🌑 Gradient
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    /// 📝 Text
                    Positioned(
                      bottom: AppDimens.medium,
                      left: AppDimens.medium,
                      child: Text(
                        "🔥 Big Sale",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16 * s, // ✅ responsive
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: AppDimens.imageSize * 0.9, // ❗ شبه ثابت (180 تقريباً)
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,

            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),

        const SizedBox(height: AppDimens.small),

        /// 💫 Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ads.asMap().entries.map((entry) {
            bool isActive = currentIndex == entry.key;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isActive ? 12.0 : 8.0, // ❌ ثابت
              height: 8.0,
              margin: const EdgeInsets.symmetric(
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primaryPurple : AppColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
