import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/data/model/service_areas_model.dart';

class SubServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback? onTap;

  const SubServiceCard({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimens.cardRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimens.cardRadius)),
              child: Image.asset(
                service.image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // التفاصيل
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium16 / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        service.name,
                        style: AppTextStyles.productName.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$${service.price}",
                        style:
                            AppTextStyles.productPrice.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    service.providerName,
                    style: AppTextStyles.productDescription
                        .copyWith(fontSize: 12, height: 1.2),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        if (index < service.rating.floor()) {
                          return const Icon(Icons.star,
                              color: Colors.amber, size: 14);
                        } else if (index < service.rating) {
                          return const Icon(Icons.star_half,
                              color: Colors.amber, size: 14);
                        } else {
                          return const Icon(Icons.star_border,
                              color: Colors.amber, size: 14);
                        }
                      }),
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
