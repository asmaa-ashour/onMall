// lib/widgets/product_image.dart
import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';

class ProductImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;

  const ProductImage({
    super.key,
    this.imageUrl,
    this.width = double.infinity,
    this.height = 250,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.pink.shade100,
        image: imageUrl != null
            ? DecorationImage(
                image: AssetImage(imageUrl!),
                fit: BoxFit.cover, // لتغطية المساحة كاملة
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: imageUrl == null
          ? const Center(
              child: Icon(Icons.image, size: 50, color: Colors.grey),
            )
          : null, // لا حاجة لـ child عند وجود صورة
    );
  }
}
