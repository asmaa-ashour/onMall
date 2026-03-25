import 'package:get/get.dart';
import 'package:second/data/model/product_model.dart';
import '../services/api_service.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProductsByStore(int storeId);
  Future<List<ProductModel>> searchProducts(String query);
}

class ProductRepositoryImpl extends GetxService implements ProductRepository {
  final ApiService _apiService = Get.find<ApiService>();

  // بيانات تجريبية
  final List<ProductModel> _mockProducts = [
    ProductModel(
      id: 1,
      name: 'Modern Leather Sofa',
      description: 'Comfortable modern leather sofa with premium quality',
      imageUrl:
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
      price: 499.99,
      oldPrice: 699.99,
      rating: 4.8,
      reviews: 234,
      discount: 28,
      category: 'Furniture',
      inStock: true,
      sizes: ['Small', 'Medium', 'Large'],
      colors: ['Black', 'Brown', 'Gray'],
    ),
    ProductModel(
      id: 2,
      name: 'Wooden Dining Table',
      description: 'Elegant wooden dining table for 6 people',
      imageUrl:
          'https://images.unsplash.com/photo-1577140917170-285929fb55b7?w=400',
      price: 299.99,
      oldPrice: 399.99,
      rating: 4.6,
      reviews: 156,
      discount: 25,
      category: 'Furniture',
      inStock: true,
      sizes: ['Medium', 'Large'],
      colors: ['Brown', 'Oak'],
    ),
    ProductModel(
      id: 3,
      name: 'Floor Lamp',
      description: 'Modern floor lamp with adjustable brightness',
      imageUrl:
          'https://images.unsplash.com/photo-1507473885765-e6b057feb358?w=400',
      price: 89.99,
      oldPrice: 129.99,
      rating: 4.7,
      reviews: 89,
      discount: 30,
      category: 'Lighting',
      inStock: true,
      sizes: ['Standard'],
      colors: ['Black', 'White', 'Gold'],
    ),
    ProductModel(
      id: 4,
      name: 'Office Desk Chair',
      description: 'Ergonomic office chair with lumbar support',
      imageUrl:
          'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?w=400',
      price: 199.99,
      oldPrice: 299.99,
      rating: 4.9,
      reviews: 312,
      discount: 33,
      category: 'Office',
      inStock: true,
      sizes: ['One Size'],
      colors: ['Black', 'Gray', 'Blue'],
    ),
    ProductModel(
      id: 5,
      name: 'Decorative Wall Art',
      description: 'Beautiful abstract wall painting',
      imageUrl:
          'https://images.unsplash.com/photo-1513519245088-0e12902e35a5?w=400',
      price: 49.99,
      oldPrice: 79.99,
      rating: 4.5,
      reviews: 67,
      discount: 37,
      category: 'Decoration',
      inStock: true,
      sizes: ['Small', 'Medium', 'Large'],
      colors: ['Multicolor'],
    ),
  ];

  @override
  Future<List<ProductModel>> getProductsByStore(int storeId) async {
    // محاكاة تأخير الشبكة
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProducts;
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return _mockProducts;
    return _mockProducts
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
