import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/data/model/service_areas_model.dart';
import 'package:second/view/screen/services_and_stores/sub_services_screen.dart';

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(SubServicesScreen(
          categoryName: service.name,
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppDimens.medium16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: AppDimens.small8,
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimens.borderRadius)),
              child: Image.asset(
                service.image,
                height: AppDimens.imageSize - 70,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم الخدمة + السعر
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          service.name,
                          style:
                              AppTextStyles.productName.copyWith(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${service.price}",
                        style:
                            AppTextStyles.productPrice.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.verysmall4),
                  // مزود الخدمة + النجوم
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          service.providerName,
                          style: AppTextStyles.productDescription,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          if (index < service.rating.floor()) {
                            return const Icon(Icons.star,
                                color: Colors.amber, size: 16);
                          } else if (index < service.rating) {
                            return const Icon(Icons.star_half,
                                color: Colors.amber, size: 16);
                          } else {
                            return const Icon(Icons.star_border,
                                color: Colors.amber, size: 16);
                          }
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
