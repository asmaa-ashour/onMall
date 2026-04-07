import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/data/model/service_areas_model.dart';

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppDimens.small,
        horizontal: AppDimens.medium,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: AppDimens.small,
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Image + Favorite
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimens.borderRadius),
                ),
                child: Image.asset(
                  service.image,
                  height: AppDimens.imageSize - 50, // بدل 150
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: AppDimens.small,
                right: AppDimens.small,
                child: Icon(
                  service.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ],
          ),

          /// 🔹 Content
          Padding(
            padding: const EdgeInsets.all(AppDimens.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: AppTextStyles.productName.copyWith(fontSize: 18),
                ),
                const SizedBox(height: AppDimens.small),
                Text(
                  service.providerName,
                  style: AppTextStyles.productDescription,
                ),
                const SizedBox(height: AppDimens.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${service.price}",
                      style: AppTextStyles.productPrice,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text("${service.rating}"),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
