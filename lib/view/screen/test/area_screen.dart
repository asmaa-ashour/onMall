import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/area_controller.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/view/widget/test/category_card.dart';

class AreasPage extends StatelessWidget {
  const AreasPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AreaController());

    return Scaffold(
      appBar: AppBar(title: const Text("Areas")),
      body: GetBuilder<AreaController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColor.prrimaryColor,
            ));
          }

          if (controller.statusRequest == StatusRequest.failure) {
            return const Center(child: Text("Error"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.areas.length,
            itemBuilder: (context, index) {
              final item = controller.areas[index];

              return CategoryCard(
                id: item.id, // لازم تضيف id للـ AreaModel
                title: item.title,
                image: item.image,
                isLeft: index.isEven,
              );
            },
          );
        },
      ),
    );
  }
}
/*
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> categories = [
    {"title": "Home Furniture", "image": ImageAsset.f1},
    {"title": "Office Furniture", "image": ImageAsset.f2},
    {"title": "Home Decoration", "image": ImageAsset.f3},
    {"title": "Storage", "image": ImageAsset.f4},
    {"title": "Light", "image": ImageAsset.f5},
  ];

  String query = "";

  @override
  Widget build(BuildContext context) {
    List filtered = categories
        .where((e) => e["title"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      // appBar: AppBar(
      //   title: const Text("Categories"),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   foregroundColor: Colors.black,
      // ),
      body: Column(
        children: [
          SizedBox(height: 40),
          // 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: (val) {
                  setState(() {
                    query = val;
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search ...",
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),

          // 📦 LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final item = filtered[index];

                return CategoryCard(
                  title: item["title"]!,
                  image: item["image"]!,
                  isLeft: index.isEven,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/