import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onTap;

  const ItemCard({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              // الصورة
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: image.startsWith("http")
                      ? Image.network(
                          image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset("assets/images/f1.jpg",
                                  fit: BoxFit.cover),
                        )
                      : Image.asset(image,
                          width: double.infinity, fit: BoxFit.cover),
                ),
              ),

              // العنوان
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff3a2f2a),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
