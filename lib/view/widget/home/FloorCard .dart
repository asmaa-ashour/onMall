import 'package:flutter/material.dart';
import 'package:second/data/model/floorModel.dart';
import 'package:second/view/screen/floor_details_page.dart';

class FloorCard extends StatelessWidget {
  final FloorModel floor;
  final double scale;
  final double translateY;

  const FloorCard({
    super.key,
    required this.floor,
    this.scale = 1.0,
    this.translateY = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, translateY),
      child: Transform.scale(
        scale: scale,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FloorDetailsPage(
                  floorTitle: floor.title,
                  stores: floor.stores, // ✅ كل شيء يعرف نوعه
                ),
              ),
            );
          },
          child: Hero(
            tag: floor.title, // لازم يكون فريد لكل كارد
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      floor.image,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black87],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Text(
                        floor.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
