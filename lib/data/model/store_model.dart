class StoreModel {
  final int id;
  final String name;
  final String imageUrl;
  final String category;
  final String floor;
  final double rating;
  final int reviews;
  final bool isOpen;
  final String description;
  final String phone;
  final String email;
  final String openingHours;
  final String closingHours;
  final List<String> tags;
  final bool hasOffer;
  final int offerPercentage;

  StoreModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.floor,
    required this.rating,
    required this.reviews,
    required this.isOpen,
    required this.description,
    required this.phone,
    required this.email,
    required this.openingHours,
    required this.closingHours,
    required this.tags,
    required this.hasOffer,
    required this.offerPercentage,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      category: json['category'],
      floor: json['floor'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      isOpen: json['is_open'],
      description: json['description'],
      phone: json['phone'],
      email: json['email'],
      openingHours: json['opening_hours'],
      closingHours: json['closing_hours'],
      tags: List<String>.from(json['tags'] ?? []),
      hasOffer: json['has_offer'] ?? false,
      offerPercentage: json['offer_percentage'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'category': category,
      'floor': floor,
      'rating': rating,
      'reviews': reviews,
      'is_open': isOpen,
      'description': description,
      'phone': phone,
      'email': email,
      'opening_hours': openingHours,
      'closing_hours': closingHours,
      'tags': tags,
      'has_offer': hasOffer,
      'offer_percentage': offerPercentage,
    };
  }
}
