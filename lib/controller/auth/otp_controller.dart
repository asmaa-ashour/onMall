import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../data/datasource/remote/auth_datda.dart';

class OtpController extends GetxController {
  late AuthData authData;
  StatusRequest statusRequest = StatusRequest.none; // الحالة الافتراضية
  bool isVerified = false; // هل تم التحقق من الكود

  @override
  void onInit() {
    super.onInit();
    if (!Get.isRegistered<AuthData>()) {
      Get.put(AuthData(Get.find()));
    }
    authData = Get.find<AuthData>();
  }

  Future<void> verifyOtp(String email, String code) async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await authData.verifyOtp(email, code); // استدعاء الداتا سورس
      // نتأكد من أن response Map<String,dynamic>
      if (response != null && response is Map<String, dynamic>) {
        statusRequest = handlingData({
          "status": response["status"],
          "message": response["message"],
        });

        if (statusRequest == StatusRequest.success &&
            response["status"] == "success") {
          isVerified = true;
        } else {
          isVerified = false;
        }
      } else {
        statusRequest = StatusRequest.failure;
        isVerified = false;
      }
    } catch (e) {
      statusRequest = StatusRequest.failure;
      isVerified = false;
    }

    update();
  }
}