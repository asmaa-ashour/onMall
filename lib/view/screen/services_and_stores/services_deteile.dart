import 'package:flutter/material.dart';
import 'package:second/core/constant/imageassets.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: 500,
            height: 300,
            child: Image.asset(
              ImageAsset.f4,
              fit: BoxFit.cover,
            ),
          ),

          /// 🔥 Gradient غامق من تحت
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
