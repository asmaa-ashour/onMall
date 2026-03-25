import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second/controller/home/homeController.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/data/datasource/static/static.dart';
import 'package:second/view/widget/home/FloorCard.dart';

class FloorsSection extends StatelessWidget {
  FloorsSection({super.key});
  final FloorController controller = Get.put(FloorController());
  final PageController pageController = PageController(viewportFraction: 0.55);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GetBuilder<FloorController>(
        builder: (_) {
          if (_.statusRequest == StatusRequest.loading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColor.prrimaryColor,
            ));
          }
          if (_.statusRequest == StatusRequest.failure) {
            return const Center(child: Text("Failed to load floors"));
          }

          return PageView.builder(
            controller: pageController,
            itemCount: _.floors.length,
            padEnds: false,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              double diff = pageController.hasClients
                  ? ((pageController.page ?? pageController.initialPage)
                          .toDouble() -
                      index.toDouble())
                  : 0.0;
              double scale = (1 - diff.abs() * 0.2).clamp(0.85, 1.0);
              double translateY = 30 * diff.abs();
              double blur = (diff.abs() * 5).clamp(0, 5);
              double opacity = (1 - diff.abs() * 0.3).clamp(0.5, 1.0);

              return Transform.translate(
                offset: Offset(0, translateY),
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: FloorCard(
                      floor: _.floors[index],
                      isActive: diff.abs() < 0.3,
                      parallaxOffset: diff,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/*
class FloorsSection extends StatefulWidget {
  const FloorsSection({super.key});

  @override
  State<FloorsSection> createState() => _FloorsSectionState();
}

class _FloorsSectionState extends State<FloorsSection> {
  final PageController controller = PageController(
    viewportFraction: 0.55,
    // 🔥 إضافة هذا السطر عشان يبدأ من البداية
  );

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
      height: 280,
      child: PageView.builder(
        controller: controller,
        itemCount: floors.length,
        physics: const BouncingScrollPhysics(),
        // 🔥 إضافة Padding لليسار عشان أول كارد يبدأ من الحافة
        padEnds: false, // 🔥 هذا يلغي المسافات الزائدة في البداية والنهاية
        itemBuilder: (context, index) {
          double diff = currentPage - index;

          double scale = (1 - diff.abs() * 0.2).clamp(0.85, 1.0);
          double translateY = 30 * diff.abs();
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
                      isActive: diff.abs() < 0.3,
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
*/