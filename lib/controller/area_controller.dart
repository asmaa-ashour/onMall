import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/function/handling_data.dart';
import 'package:second/data/datasource/remote/area_data.dart';
import 'package:second/data/model/area_model.dart';

class AreaController extends GetxController {
  AreaData areaData = AreaData(Get.find());

  List<AreaModel> areas = [];
  List<AreaModel> filteredAreas = []; // المناطق بعد الفلترة
  StatusRequest statusRequest = StatusRequest.none;

  late int floorId;

  @override
  void onInit() {
    floorId = Get.arguments["floorId"]; // 🔥 استقبلنا الطابق
    getAreas();
    super.onInit();
  }

  getAreas() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await areaData.getData(floorId);

    if (response is StatusRequest) {
      statusRequest = response;
    } else {
      areas = List<AreaModel>.from(
        response.map((e) => AreaModel.fromJson(e)),
      );
      filteredAreas = areas;
      statusRequest = StatusRequest.success;
    }

    update();
  }

  void filterAreas(String value) {
    if (value.isEmpty) {
      filteredAreas = areas;
    } else {
      filteredAreas = areas
          .where(
              (area) => area.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    update();
  }
}
