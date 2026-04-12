import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/view/widget/button.dart';
import 'package:second/view/widget/services/containt_detiales.dart';
import 'package:second/view/widget/services/header_detelies.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // ===== BODY =====
          SingleChildScrollView(
            child: Column(
              children: [
                const HeaderDetials(),
                const ContaintDetiales(),

                // ================= BUTTON =================

                // Button(
                //   backgroundColor: AppColors.primaryPurple,
                //   textColor: AppColors.white,
                //   title: "Book Now",
                //   borderRadius: 16,
                // ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  )
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          // Button(
          //     backgroundColor: AppColors.primaryPurple,
          //     textColor: AppColors.white,
          //     title: "Book Now",
          //     borderRadius: 16)
        ],
      ),
    );
  }
}
