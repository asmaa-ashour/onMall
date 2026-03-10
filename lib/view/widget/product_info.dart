// lib/widgets/product_info.dart
import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/data/model/product_model.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.name,
          style: AppTextStyles.productName,
          textAlign: TextAlign.center,
        ),
        if (product.brand != null) ...[
          const SizedBox(height: AppDimens.small),
          Text(
            product.brand!,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
        const SizedBox(height: AppDimens.small),
        Text(
          product.price,
          style: AppTextStyles.productPrice,
        ),
        const SizedBox(height: AppDimens.medium),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
          child: Text(
            product.description,
            style: AppTextStyles.productDescription,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
