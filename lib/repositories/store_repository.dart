import 'package:get/get.dart';
import 'package:second/data/model/store_model.dart';
import '../services/api_service.dart';

abstract class StoreRepository {
  Future<List<StoreModel>> getStoresByFloor(int floorId);
  Future<List<StoreModel>> searchStores(String query);
  Future<StoreModel> getStoreDetails(int storeId);
}

class StoreRepositoryImpl extends GetxService implements StoreRepository {
  final ApiService _apiService = Get.find<ApiService>();

  // بيانات تجريبية
  final List<StoreModel> _mockStores = [
    StoreModel(
      id: 1,
      name: 'Zara Home',
      imageUrl:
          'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=400',
      category: 'Home Decor',
      floor: 'Ground Floor',
      rating: 4.8,
      reviews: 1240,
      isOpen: true,
      description: 'Modern home furniture and accessories',
      phone: '+1234567890',
      email: 'contact@zarahome.com',
      openingHours: '10:00 AM',
      closingHours: '10:00 PM',
      tags: ['Furniture', 'Decor', 'Luxury'],
      hasOffer: true,
      offerPercentage: 20,
    ),
    StoreModel(
      id: 2,
      name: 'IKEA',
      imageUrl:
          'https://images.unsplash.com/photo-1556909172-54557c7e4fb7?w=400',
      category: 'Furniture',
      floor: 'Ground Floor',
      rating: 4.6,
      reviews: 3420,
      isOpen: true,
      description: 'Affordable home furnishing solutions',
      phone: '+1234567891',
      email: 'support@ikea.com',
      openingHours: '9:00 AM',
      closingHours: '11:00 PM',
      tags: ['Furniture', 'Affordable', 'Modern'],
      hasOffer: false,
      offerPercentage: 0,
    ),
    StoreModel(
      id: 3,
      name: 'Apple Store',
      imageUrl:
          'https://images.unsplash.com/photo-1555421689-3f034debb7a6?w=400',
      category: 'Electronics',
      floor: 'First Floor',
      rating: 4.9,
      reviews: 2150,
      isOpen: true,
      description: 'Premium electronics and gadgets',
      phone: '+1234567892',
      email: 'store@apple.com',
      openingHours: '10:00 AM',
      closingHours: '9:00 PM',
      tags: ['Electronics', 'Premium', 'Gadgets'],
      hasOffer: false,
      offerPercentage: 0,
    ),
    StoreModel(
      id: 4,
      name: 'Nike',
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      category: 'Sportswear',
      floor: 'First Floor',
      rating: 4.7,
      reviews: 1890,
      isOpen: true,
      description: 'Sports shoes and athletic wear',
      phone: '+1234567893',
      email: 'store@nike.com',
      openingHours: '10:00 AM',
      closingHours: '10:00 PM',
      tags: ['Sportswear', 'Shoes', 'Athletic'],
      hasOffer: true,
      offerPercentage: 15,
    ),
    StoreModel(
      id: 5,
      name: 'Starbucks',
      imageUrl:
          'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=400',
      category: 'Coffee Shop',
      floor: 'Second Floor',
      rating: 4.5,
      reviews: 980,
      isOpen: true,
      description: 'Premium coffee and beverages',
      phone: '+1234567894',
      email: 'store@starbucks.com',
      openingHours: '7:00 AM',
      closingHours: '11:00 PM',
      tags: ['Coffee', 'Beverages', 'Snacks'],
      hasOffer: true,
      offerPercentage: 10,
    ),
  ];

  @override
  Future<List<StoreModel>> getStoresByFloor(int floorId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // محاكاة جلب متاجر حسب الطابق
    return _mockStores
        .where((store) =>
            (floorId == 1 && store.floor == 'Ground Floor') ||
            (floorId == 2 && store.floor == 'First Floor') ||
            (floorId == 3 && store.floor == 'Second Floor'))
        .toList();
  }

  @override
  Future<List<StoreModel>> searchStores(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return _mockStores;
    return _mockStores
        .where((store) =>
            store.name.toLowerCase().contains(query.toLowerCase()) ||
            store.category.toLowerCase().contains(query.toLowerCase()) ||
            store.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Future<StoreModel> getStoreDetails(int storeId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final store = _mockStores.firstWhere((store) => store.id == storeId);
    return store;
  }
}
