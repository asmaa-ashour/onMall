import 'package:flutter/material.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/view/widget/test/category_card.dart';

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
