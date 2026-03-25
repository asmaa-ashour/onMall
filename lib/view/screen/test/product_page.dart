import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/product_controller.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/view/widget/test/product_card.dart';

class ProductsPage extends StatelessWidget {
  final String areaId;
  const ProductsPage({super.key, required this.areaId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController(areaId));

    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: GetBuilder<ProductController>(
        builder: (_) {
          if (_.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_.statusRequest == StatusRequest.failure) {
            return const Center(child: Text("Error loading products"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _.products.length,
            itemBuilder: (context, index) {
              final product = _.products[index];
              return ProductCard(
                title: product.title,
                image: product.image,
                price: product.price,
              );
            },
          );
        },
      ),
    );
  }
}
