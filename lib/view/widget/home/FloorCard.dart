import 'package:flutter/material.dart';
import 'package:second/data/model/floorModel.dart';
import 'package:second/view/screen/floor_details_page.dart';

class FloorCard extends StatelessWidget {
  final FloorModel floor;
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FloorDetailsPage(
              floorTitle: floor.title,
              stores: floor.stores,
            ),
          ),
        );
      },
      child: Hero(
        tag: floor.title,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4), // 🔥 هامش أقل
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

            // 🔥 Glow للكارد الحالي
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
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // 🔥 Parallax للصورة
                Transform.translate(
                  offset: Offset(parallaxOffset * 40, 0),
                  child: Image.asset(
                    floor.image,
                    height: 280, // 🔥 خلي الطول كما هو
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  height: 280, // 🔥 خلي الطول كما هو
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 20,
                  left: 15,
                  child: Text(
                    floor.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
