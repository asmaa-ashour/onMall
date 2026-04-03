import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/dynamic_Controller.dart';
import 'package:second/data/model/area_model.dart';
import 'package:second/view/widget/test/item_Card.dart';

class DynamicDetailsPage extends StatelessWidget {
  const DynamicDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DynamicController());

    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments["name"]),
      ),
      body: GetBuilder<DynamicController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.items.isEmpty) {
            return const Center(child: Text("No data"));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              var item = controller.items[index];
              final area = AreaModel.fromJson(item);

              return ItemCard(
                title: area.name ?? "",
                image: area.media != null && area.media!.isNotEmpty
                    ? area.media![0].url ?? "assets/images/f1.jpg"
                    : "assets/images/f1.jpg",
              );
            },
          );
        },
      ),
    );
  }
}
