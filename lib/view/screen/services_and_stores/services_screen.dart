import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/data/model/service_areas_model.dart';
import 'package:second/view/widget/services_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 بيانات ثابتة
    final List<Service> services = [
      Service(
        name: "Hair Styling",
        providerName: "Beauty Salon",
        price: 25,
        rating: 4.7,
        isFavorite: true,
        image: "assets/images/services.png",
      ),
      Service(
        name: "Car Wash",
        providerName: "Clean Center",
        price: 10,
        rating: 4.3,
        isFavorite: false,
        image: "assets/images/services.png",
      ),
      Service(
        name: "Makeup",
        providerName: "Glam Studio",
        price: 40,
        rating: 4.9,
        isFavorite: true,
        image: "assets/images/services.png",
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Services",
          style: AppTextStyles.productName.copyWith(
            fontSize: 22,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.small,
        ),
        child: ListView.separated(
          itemCount: services.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppDimens.medium),
          itemBuilder: (context, index) {
            return ServiceCard(
              service: services[index],
            );
          },
        ),
      ),
    );
  }
}
