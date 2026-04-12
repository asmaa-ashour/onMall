import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/view/widget/services/info_card.dart';

class ContaintDetiales extends StatelessWidget {
  const ContaintDetiales({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.medium.w),
      transform: Matrix4.translationValues(0, -20.w, 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.borderRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE + PRICE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hair Styling", style: AppTextStyles.productName),
              Text("\$25", style: AppTextStyles.productPrice),
            ],
          ),

          SizedBox(height: AppDimens.small.w),

          // RATING
          Row(
            children: const [
              Icon(Icons.star, color: AppColors.secondaryPurple, size: 18),
              SizedBox(width: 5),
              Text("4.8"),
              SizedBox(width: 10),
              Text("(120 Reviews)", style: TextStyle(color: AppColors.grey)),
            ],
          ),

          SizedBox(height: AppDimens.medium.w),

          // DESCRIPTION
          const Text("Description",
              style: TextStyle(fontWeight: FontWeight.bold)),

          SizedBox(height: AppDimens.small.w),

          const Text(
            "Professional hair styling service with the latest trends and techniques.",
            style: AppTextStyles.productDescription,
          ),

          SizedBox(height: AppDimens.medium.w),

          // INFO CARDS
          const Row(
            children: [
              InfoCard(title: "Duration", value: "60 min"),
              InfoCard(title: "Price", value: "\$25"),
              InfoCard(title: "Rating", value: "4.8"),
            ],
          ),

          SizedBox(height: AppDimens.large.w),

          // PROVIDER
          Row(
            children: [
              CircleAvatar(
                radius: 25.w,
                backgroundImage: AssetImage(ImageAsset.clean),
              ),
              SizedBox(width: AppDimens.small.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Salon Beauty",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Expert Stylist",
                      style: TextStyle(color: AppColors.grey)),
                ],
              )
            ],
          ),

          SizedBox(height: 80.w),
        ],
      ),
    );
  }
}
