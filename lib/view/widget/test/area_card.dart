import 'package:flutter/material.dart';
import 'package:second/view/screen/home/HomePage.dart';

class AreaCard extends StatefulWidget {
  final String id;
  final String title;
  final String image;
  final bool isLeft;

  const AreaCard({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.isLeft,
  });

  @override
  State<AreaCard> createState() => _AreaCardCardState();
}

class _AreaCardCardState extends State<AreaCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(),
          ),
        );
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        height: 70,
        transform: Matrix4.identity()..scale(isPressed ? 0.97 : 1.0),
        decoration: BoxDecoration(
          color: const Color(0xffe9e1d7),
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

            /// 🔥 النص
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16), // ✅ رجعنا البادينغ
                child: Align(
                  alignment: widget.isLeft
                      ? Alignment.centerLeft
                      : Alignment.centerRight, // 🔥 يلزق حسب الاتجاه
                  child: Text(
                    widget.title,
                    textAlign: widget.isLeft ? TextAlign.left : TextAlign.right,
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

            if (!widget.isLeft) _buildImageRight(),
          ],
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
    return widget.image.startsWith("http")
        ? Image.network(
            widget.image,
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
            widget.image,
            width: 120,
            height: double.infinity,
            fit: BoxFit.cover,
          );
  }
}
