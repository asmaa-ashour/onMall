import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/data/model/floorModel.dart';
import 'package:second/view/screen/test/area_screen.dart';

class FloorCard extends StatelessWidget {
  final FloorsModel floor;
  final bool isActive;
  final double parallaxOffset;

  const FloorCard({
    super.key,
    required this.floor,
    this.isActive = false,
    this.parallaxOffset = 0,
  });

  @override
  Widget build(BuildContext context) {
    double s = SizeConfig.scaleFactor.clamp(0.9, 1.2);

    return GestureDetector(
      onTap: () {
        Get.to(
          () => const AreasPage(),
          arguments: {
            "floorId": floor.id,
            "floorName": floor.name,
          },
        );
      },
      child: Hero(
        tag: floor.name ?? "",
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,

          /// ❌ لا تعمليها responsive
          margin: const EdgeInsets.symmetric(horizontal: AppDimens.verysmall),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    )
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
            child: Stack(
              children: [
                /// 🔥 Parallax Image
                Transform.translate(
                  offset: Offset(parallaxOffset * 40, 0),
                  child: floor.imageUrl != null
                      ? Image.network(
                          floor.imageUrl!,
                          height: 280, // ❌ ثابت
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/images/f1.jpg",
                          height: 280,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),

                /// 🔥 Gradient
                Container(
                  height: 280,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                /// 🔥 Title
                Positioned(
                  bottom: AppDimens.medium,
                  left: AppDimens.medium,
                  child: Text(
                    floor.name ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.w, // ✅ responsive
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
