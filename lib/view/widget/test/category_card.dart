import 'package:flutter/material.dart';
import 'package:second/view/screen/home/HomePage.dart';
import 'package:second/view/screen/test/store_page.dart';

class CategoryCard extends StatefulWidget {
  final String id;
  final String title;
  final String image;
  final bool isLeft;

  const CategoryCard({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.isLeft,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);

        // 🔥 هون بنفتح صفحة المتاجر
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(
                // areaId: widget.id, // لازم تضيف id للـ AreaModel
                // areaName: widget.title,
                ),
          ),
        );
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 18),
        height: 90,
        transform: Matrix4.identity()..scale(isPressed ? 0.97 : 1.0),
        decoration: BoxDecoration(
          color: const Color(0xffe9e1d7), // 🎨 نفس الصورة تقريباً
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
            if (widget.isLeft) _buildImageLeft(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3a2f2a),
                  ),
                ),
              ),
            ),
            if (!widget.isLeft) _buildImageRight(),
          ],
        ),
      ),
    );
  }

  // 🔥 صورة على اليسار (curve من اليمين)
  Widget _buildImageLeft() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        topRight: Radius.circular(60), // 👈 الكيرف الفخم
        bottomRight: Radius.circular(60),
      ),
      child: Image.asset(
        widget.image,
        width: 120,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  // 🔥 صورة على اليمين (curve من اليسار)
  Widget _buildImageRight() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
        topLeft: Radius.circular(60), // 👈 الكيرف الفخم
        bottomLeft: Radius.circular(60),
      ),
      child: Image.asset(
        widget.image,
        width: 120,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
