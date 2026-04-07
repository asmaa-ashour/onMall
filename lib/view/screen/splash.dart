import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/splash.dart';
import 'package:second/core/constant/imageassets.dart';

class LogoPge extends StatefulWidget {
  const LogoPge({super.key});

  @override
  State<LogoPge> createState() => _LogoPgeState();
}

class _LogoPgeState extends State<LogoPge>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    Get.put(LogoControllerImp());

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, -2), // من فوق
      end: const Offset(0, 0),    // مكانه الطبيعي
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff8B2C3A),
        ),
        child: Center(
          child: FadeTransition(
            opacity: controller, // ✨ fade
            child: SlideTransition(
              position: slideAnimation, // 🎬 نزول من فوق
              child: Image(
  image: AssetImage(ImageAsset.logo),
  width: MediaQuery.of(context).size.width * 0.6,
  color: const Color(0xFFFFD700), // دهبي
  colorBlendMode: BlendMode.srcIn,
)
            ),
          ),
        ),
      ),
    );
  }
}