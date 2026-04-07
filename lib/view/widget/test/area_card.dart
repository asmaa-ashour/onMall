import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/view/screen/home/HomePage.dart';
import 'package:second/view/screen/test/dynamic_Details_Page%20.dart';

class AreaCard extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final bool isLeft;
  final String usageType; // جديد

  const AreaCard({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.isLeft,
    required this.usageType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xffe9e1d7),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            Get.to(() => const DynamicDetailsPage(), arguments: {
              "areaId": id, // ✅ صار جاهز
              "type": usageType, // 🔥 مهم (لازم تمرريه كمان)
              "name": title,
            });
          },
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                )
              ],
            ),
            child: Row(
              children: [
                if (isLeft) _buildImageLeft(),

                /// 🔥 النص
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment:
                          isLeft ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        title,
                        textAlign: isLeft ? TextAlign.left : TextAlign.right,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff3a2f2a),
                        ),
                      ),
                    ),
                  ),
                ),

                if (!isLeft) _buildImageRight(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔥 صورة يسار
  Widget _buildImageLeft() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        topRight: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      child: _buildImage(),
    );
  }

  /// 🔥 صورة يمين
  Widget _buildImageRight() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
        topLeft: Radius.circular(60),
        bottomLeft: Radius.circular(60),
      ),
      child: _buildImage(),
    );
  }

  /// 🔥 دعم network + asset
  Widget _buildImage() {
    return image.startsWith("http")
        ? Image.network(
            image,
            width: 120,
            height: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/f1.jpg",
                width: 120,
                height: double.infinity,
                fit: BoxFit.cover,
              );
            },
          )
        : Image.asset(
            image,
            width: 120,
            height: double.infinity,
            fit: BoxFit.cover,
          );
  }
}
