import 'package:get/get.dart';
import 'package:second/data/datasource/remote/services_data.dart';
import 'package:second/data/datasource/remote/store_data.dart';

class DynamicController extends GetxController {
  late int areaId;
  late String type;

  List items = [];
  bool isLoading = false;

  late StoreData storeData;
  late ServiceData serviceData;

  @override
  void onInit() {
    areaId = Get.arguments["areaId"];
    type = Get.arguments["type"];

    storeData = StoreData(Get.find());
    serviceData = ServiceData(Get.find());

    getData();
    super.onInit();
  }

  getData() async {
    isLoading = true;
    update();

    var response;

    if (type == "store") {
      response = await storeData.getData(areaId);
    } else {
      response = await serviceData.getData(areaId);
    }

    if (response is List) {
      items = response;
    } else {
      items = [];
    }

    isLoading = false;
    update();
  }
}
