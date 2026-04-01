import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/area_controller.dart';
import 'package:second/core/class/handlingdataview.dart';
import 'package:second/view/widget/test/category_card.dart';

class AreasPage extends StatelessWidget {
  const AreasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AreaController());

    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments["floorName"] ?? "Areas"),
      ),
      body: Column(
        children: [
          // 🔹 حقل البحث
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: TextField(
          //     onChanged: (value) {
          //       controller.filterAreas(value); // فلترة القائمة عند الكتابة
          //     },
          //     decoration: InputDecoration(
          //       hintText: "Search areas...",
          //       prefixIcon: const Icon(Icons.search),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //     ),
          //   ),
          // ),

          // 🔹 قائمة المناطق
          Expanded(
            child: GetBuilder<AreaController>(
              builder: (_) {
                return HandlingDataView(
                  statusRequest: _.statusRequest,
                  widget: _.filteredAreas.isEmpty
                      ? const Center(child: Text("No areas found"))
                      : ListView.builder(
                          itemCount: _.filteredAreas.length,
                          itemBuilder: (context, index) {
                            var item = _.filteredAreas[index];
                            return CategoryCard(
                              id: item.id.toString(),
                              title: item.name ?? "",
                              image:
                                  item.media != null && item.media!.isNotEmpty
                                      ? item.media![0].url ?? ""
                                      : "assets/images/f1.jpg",
                              isLeft: index % 2 == 0,
                            );
                          },
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
