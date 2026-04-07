// <<<<<<< HEAD
// =======
// // <<<<<<< HEAD
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:second/controller/store_controller.dart';
// // import 'package:second/core/class/status_request.dart';
// // import 'package:second/core/constant/color.dart';
// // import 'package:second/view/widget/test/store_card.dart';
// // =======
// >>>>>>> 1c36488fe19fd6ff647c92aee2c5398939e5d420
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:second/controller/store_controller.dart';
// // import 'package:second/core/class/status_request.dart';
// // import 'package:second/core/constant/color.dart';
// // import 'package:second/view/widget/test/store_card.dart';
// <<<<<<< HEAD
// =======
// // >>>>>>> origin/feature/store_and_product
// >>>>>>> 1c36488fe19fd6ff647c92aee2c5398939e5d420

// // class StoresPage extends StatelessWidget {
// //   final String areaId;
// //   final String areaName;

// //   const StoresPage({
// //     super.key,
// //     required this.areaId,
// //     required this.areaName,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = Get.put(StoreController(areaId));

// <<<<<<< HEAD
// =======
// // <<<<<<< HEAD
// //     return Scaffold(
// //       appBar: AppBar(title: Text(areaName)),
// //       body: GetBuilder<StoreController>(
// //         builder: (_) {
// //           if (_.statusRequest == StatusRequest.loading) {
// //             return const Center(
// //               child: CircularProgressIndicator(
// //                 color: AppColor.prrimaryColor,
// //               ),
// //             );
// //           }
// // =======
// >>>>>>> 1c36488fe19fd6ff647c92aee2c5398939e5d420
// //     return Scaffold(
// //       appBar: AppBar(title: Text(areaName)),
// //       body: GetBuilder<StoreController>(
// //         builder: (_) {
// //           if (_.statusRequest == StatusRequest.loading) {
// //             return const Center(
// //               child: CircularProgressIndicator(
// //                 color: AppColor.prrimaryColor,
// //               ),
// //             );
// //           }
// <<<<<<< HEAD
// =======
// // >>>>>>> origin/feature/store_and_product
// >>>>>>> 1c36488fe19fd6ff647c92aee2c5398939e5d420

// //           if (_.statusRequest == StatusRequest.failure) {
// //             return const Center(
// //               child: Text("No stores found"),
// //             );
// //           }

// //           return ListView.builder(
// //             padding: const EdgeInsets.symmetric(vertical: 16),
// //             itemCount: _.stores.length,
// //             itemBuilder: (context, index) {
// //               final store = _.stores[index];
// //               return StoreCard(
// //                 title: store.title,
// //                 image: store.image,
// //                 description: store.description,
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }