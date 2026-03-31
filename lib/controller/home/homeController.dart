import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/data/datasource/remote/floor_data.dart';
import '../../data/model/floorModel.dart';

/*
class FloorController extends GetxController {
  FloorData floorData = FloorData(Get.find());
  List<FloorsModel> floors = [];
  StatusRequest statusRequest = StatusRequest.loading;

  getFloors() async {
    statusRequest = StatusRequest.loading;
    update();

    final data = await floorData.getFloors();

    print("DATA LENGTH: ${data.length}"); // 🔥 مهم

    if (data.isNotEmpty) {
      floors = data;

      print("CONTROLLER FLOORS: ${floors.length}"); // 🔥 مهم
      for (var f in floors) {
        print(f.name);
      }

      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  void onInit() {
    getFloors();
    super.onInit();
  }
}*/
class FloorController extends GetxController {
  FloorData floorData = FloorData(Get.find());

  List<FloorsModel> floors = [];
  StatusRequest statusRequest = StatusRequest.loading;

  late PageController pageController;

  double currentPage = 0;

  @override
  void onInit() {
    super.onInit();

    pageController = PageController(viewportFraction: 0.55);

    pageController.addListener(() {
      currentPage = pageController.page ?? 0;
      update(); // 🔥 هذا السر
    });

    getFloors();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  getFloors() async {
    statusRequest = StatusRequest.loading;
    update();

    final data = await floorData.getFloors();

    if (data.isNotEmpty) {
      floors = data;

      print("CONTROLLER FLOORS: ${floors.length}"); // 🔥 مهم
      for (var f in floors) {
        print(f.name);
      }
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
