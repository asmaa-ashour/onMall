import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/data/model/service_areas_model.dart';
import 'package:second/view/widget/services/services_card.dart';
import 'package:second/view/widget/services/sub_Services_card.dart';

class SubServicesScreen extends StatelessWidget {
  final String categoryName; // اسم الخدمة العامة
  // final List<Service> subServices; // قائمة الخدمات الفرعية

  const SubServicesScreen({
    super.key,
    required this.categoryName,
    // required this.subServices,
  });

  @override
  Widget build(BuildContext context) {
    // 🔥 بيانات ثابتة
    final List<Service> subServices = [
      Service(
        name: "Hair Styling",
        providerName: "Beauty Salon",
        price: 25,
        rating: 4.7,
        isFavorite: true,
        image: ImageAsset.clean,
      ),
      Service(
        name: "Car Wash",
        providerName: "Clean Center",
        price: 10,
        rating: 4.3,
        isFavorite: false,
        image: ImageAsset.clean,
      ),
      Service(
        name: "Makeup",
        providerName: "Glam Studio",
        price: 40,
        rating: 4.9,
        isFavorite: true,
        image: ImageAsset.clean,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          categoryName,
          style: AppTextStyles.productName.copyWith(
            fontSize: 22,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium16),
        child: GridView.builder(
          padding: const EdgeInsets.all(AppDimens.medium16),
          itemCount: subServices.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return SubServiceCard(
              service: subServices[index],
              onTap: () {
                // هنا ممكن تفتح التفاصيل الفرعية لكل خدمة
              },
            );
          },
        ),
      ),
    );
  }
}
