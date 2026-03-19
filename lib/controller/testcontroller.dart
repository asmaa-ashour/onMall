import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/function/handling_data.dart';
import 'package:second/data/datasource/remote/test.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    //print("$response .............................controller");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      print(" I now in controller");
      if (response[0]['stutuse'] == 'success') {
        //print("$response ...................statuse");
        data.addAll((response[0]['categories']));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
