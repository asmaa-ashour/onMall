import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../data/datasource/remote/auth_datda.dart';
import '../../data/model/log_in_model.dart';

class LoginController extends GetxController {
  late AuthData authData;
  StatusRequest statusRequest = StatusRequest.none; // ✅ تهيئة افتراضية
  LoginModel? loginModel;

  @override
  void onInit() {
    super.onInit();
    if (!Get.isRegistered<AuthData>()) {
      Get.put(AuthData(Get.find())); // لازم يكون Crud مسجل مسبقاً
    }
    authData = Get.find<AuthData>();
  }

Future<void> login(String email, String password) async {
  statusRequest = StatusRequest.loading;
  update();

  var response = await authData.login(email, password);

  if (response != null) {
    loginModel = LoginModel.fromJson(response);

    statusRequest = handlingData({
      "status": loginModel!.status,
      "message": loginModel!.message,
    });

    if (statusRequest == StatusRequest.success) {
      if (loginModel!.status == 'success') {
        print("Login successful! Token: ${loginModel!.token}");
        // هنا تحفظ التوكن
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  } else {
    // Response null → خطأ بالشبكة أو النوع
    statusRequest = StatusRequest.failure;
  }

  update();
}
}