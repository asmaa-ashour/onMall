// lib/views/product_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/product_controller.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/data/model/product_model.dart';
import 'package:second/view/widget/buy_button.dart';
import 'package:second/view/widget/loading_widget.dart';
import 'package:second/view/widget/product_image.dart';
import 'package:second/view/widget/product_info.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Obx(
            () => controller.isLoading.value
                ? const LoadingWidget()
                : controller.hasError.value
                    ? _buildErrorWidget()
                    : _buildContent(controller),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ProductController controller) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimens.medium),

          // صورة المنتج - الآن مستطيلة وليست دائرية
          ProductImage(
            imageUrl: controller.product.value.imageUrl,
            height: 400,
            borderRadius: 20,
          ),

          const SizedBox(height: AppDimens.large),

          // معلومات المنتج
          // ProductInfo(product: controller.product.value),

          const SizedBox(height: AppDimens.large),

          // زر الشراء
          const BuyButton(),

          const SizedBox(height: AppDimens.medium),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 50, color: Colors.white),
          const SizedBox(height: AppDimens.medium),
          const Text(
            'Something went wrong',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: AppDimens.medium),
          ElevatedButton(
            onPressed: () => Get.find<ProductController>().loadProduct(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryPurple,
            ),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
