import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/function/handling_data.dart';
import 'package:second/data/datasource/remote/area_data.dart';
import 'package:second/data/model/area_model.dart';

class AreaController extends GetxController {
  AreaData data = AreaData(Get.find());

  List<AreaModel> areas = [];
  late StatusRequest statusRequest;

  getAreas() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await data.getData();

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List list = response['areas'];

        areas = list.map((e) => AreaModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getAreas();
    super.onInit();
  }
}