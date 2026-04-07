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

  final FloorController controller = Get.find<FloorController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GetBuilder<FloorController>(
        builder: (_) {
          if (_.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_.statusRequest == StatusRequest.failure) {
            return const Center(child: Text("Failed to load floors"));
          }

          return GetBuilder<FloorController>(
            id: "page", // 👈 فقط للأنيميشن
            builder: (_) {
              return PageView.builder(
                controller: _.pageController,
                itemCount: _.floors.length,
                padEnds: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  double diff = _.currentPage - index;

                  if (index == _.floors.length - 1 && diff > 0) {
                    diff = diff * 0.7;
                  }

                  double scale = (1 - diff.abs() * 0.2).clamp(0.85, 1.0);
                  double translateY = 30 * diff.abs();
                  double opacity = (1 - diff.abs() * 0.3).clamp(0.5, 1.0);

                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 6,
                      right: index == _.floors.length - 1 ? 16 : 6,
                    ),
                    child: Transform.translate(
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
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
