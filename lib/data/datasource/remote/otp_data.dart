import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';

class OtpData {
  Crud crud;
  OtpData(this.crud);

  verifyOtp(String email, String otp) async {
    var response = await crud.postData(
      AppLink.verifycodessignup,
      {
        "email": email,
        "otp": otp,
      },
      "",
    );

    return response.fold((l) => l, (r) => r);
  }
}
