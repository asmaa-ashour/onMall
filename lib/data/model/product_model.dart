// lib/models/product_model.dart
import 'package:second/core/constant/imageassets.dart';

class Product {
  final String name;
  final String price;
  final String description;
  final String? imageUrl;
  final String? brand;

  const Product({
    required this.name,
    required this.price,
    required this.description,
    this.imageUrl,
    this.brand,
  });

  // factory constructor للـ mock data
  factory Product.mock() {
    return const Product(
      name: 'Pink Skirt',
      price: '\$250',
      description:
          'this is a girl from russia amazon myntra flipkart india mumbai my name is amit chaudhary',
      brand: 'Dagadu hat',
      imageUrl: ImageAsset.onBoardingImageOne,
    );
  }
}
