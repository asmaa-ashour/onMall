import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:second/data/datasource/static/static.dart';
import 'package:second/view/widget/home/FloorCard%20.dart';

class FloorsSection extends StatefulWidget {
  const FloorsSection({super.key});

  @override
  State<FloorsSection> createState() => _FloorsSectionState();
}

class _FloorsSectionState extends State<FloorsSection> {
  final PageController controller = PageController(viewportFraction: 0.75);

  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: controller,
        itemCount: floors.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          double diff = currentPage - index;

          double scale = (1 - diff.abs() * 0.2).clamp(0.85, 1.0);
          double translateY = 40 * diff.abs();
          double blur = (diff.abs() * 5).clamp(0, 5);
          double opacity = (1 - diff.abs() * 0.3).clamp(0.5, 1.0);

          return Transform.translate(
            offset: Offset(0, translateY),
            child: Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: Stack(
                  children: [
                    // 🔥 Blur للكاردات الخلفية
                    if (diff.abs() > 0.1)
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: blur,
                              sigmaY: blur,
                            ),
                            child: Container(color: Colors.transparent),
                          ),
                        ),
                      ),

                    FloorCard(
                      floor: floors[index],
                      isActive: diff.abs() < 0.3, // 👈 الكارد الحالي
                      parallaxOffset: diff,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
