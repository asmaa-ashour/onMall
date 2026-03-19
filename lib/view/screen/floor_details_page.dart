import 'package:flutter/material.dart';
import 'package:second/data/model/storeModel.dart';

class FloorDetailsPage extends StatelessWidget {
  final String floorTitle;
  final List<StoreModel> stores;

  const FloorDetailsPage({
    super.key,
    required this.floorTitle,
    required this.stores,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(floorTitle)),
      body: stores.isEmpty
          ? Center(child: Text("No stores in this floor yet"))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: stores.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final store = stores[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15)),
                          child: Image.asset(
                            store.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(store.name),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
