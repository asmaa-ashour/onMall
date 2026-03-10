import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/splash.dart';
import 'package:second/core/constant/imageassets.dart';

class LogoPge extends StatelessWidget {
  const LogoPge({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogoControllerImp());
    return const Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(image: AssetImage(ImageAsset.logo)),
            //  Icon(
            //   Icons.airplanemode_active,
            //   color: Colors.black,
            //   size: 100,
            // ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Text("Elegance Mall",
          //     style: TextStyle(
          //         fontSize: 30,
          //         fontWeight: FontWeight.bold,
          //         shadows: <Shadow>[
          //           Shadow(
          //               offset: Offset(2.0, 2.0),
          //               blurRadius: 10,
          //               color: Color.fromARGB(255, 0, 0, 0))
          //         ]))
          // Transform.rotate(
          //   angle: 70 * 3.14 / 180, // تحديد زاوية الدوران (180 درجة)
          //   child: const Center(
          //     child: Image(image: AssetImage(ImageAsset.logo)),
          //     //  Icon(
          //     //   Icons.airplanemode_active,
          //     //   color: Colors.black,
          //     //   size: 100,
          //     // ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
