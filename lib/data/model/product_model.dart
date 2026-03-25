class ProductModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviews;
  final int discount;
  final String category;
  final bool inStock;
  final List<String> sizes;
  final List<String> colors;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviews,
    required this.discount,
    required this.category,
    required this.inStock,
    required this.sizes,
    required this.colors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      price: json['price'].toDouble(),
      oldPrice: json['old_price'].toDouble(),
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      discount: json['discount'],
      category: json['category'],
      inStock: json['in_stock'],
      sizes: List<String>.from(json['sizes'] ?? []),
      colors: List<String>.from(json['colors'] ?? []),
    );
  }

  get brand => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'old_price': oldPrice,
      'rating': rating,
      'reviews': reviews,
      'discount': discount,
      'category': category,
      'in_stock': inStock,
      'sizes': sizes,
      'colors': colors,
    };
  }

  static ProductModel mock() {
    return ProductModel(
      id: 1,
      name: 'Sample Product',
      description: 'This is a sample product',
      imageUrl: 'https://example.com/image.jpg',
      price: 99.99,
      oldPrice: 129.99,
      rating: 4.5,
      reviews: 100,
      discount: 20,
      category: 'Sample',
      inStock: true,
      sizes: ['S', 'M', 'L'],
      colors: ['Red', 'Blue'],
    );
  }
}
