import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:second/core/constant/imageassets.dart';

class AdsSection extends StatefulWidget {
  const AdsSection({super.key});

  @override
  State<AdsSection> createState() => _AdsSectionState();
}

class _AdsSectionState extends State<AdsSection> {
  int currentIndex = 0;

  final List<String> ads = [
    // "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da",
    // "https://images.unsplash.com/photo-1580910051074-3eb694886505",
    // "https://images.unsplash.com/photo-1607083206968-13611e3d76db",
    ImageAsset.onBoardingImageOne,
    ImageAsset.onBoardingImageTwo,
    ImageAsset.onBoardingImageThree,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔥 Slider
        CarouselSlider(
          items: ads.map((image) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(image, fit: BoxFit.cover),

                    // Gradient
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

                    // Text
                    const Positioned(
                      bottom: 15,
                      left: 15,
                      child: Text(
                        "🔥 Big Sale",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
            height: 180,
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

        const SizedBox(height: 10),

        // 💫 Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ads.asMap().entries.map((entry) {
            return Container(
              width: currentIndex == entry.key ? 12 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: currentIndex == entry.key ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
