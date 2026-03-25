import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/data/datasource/remote/floor_data.dart';
import '../../data/model/floorModel.dart';

class FloorController extends GetxController {
  FloorData floorData = FloorData(Get.find());
  List<FloorModel> floors = [];
  StatusRequest statusRequest = StatusRequest.loading;

  getFloors() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      final data = await floorData.getFloors();
      if (data.isNotEmpty) {
        floors = data;
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  void onInit() {
    getFloors();
    super.onInit();
  }
}
