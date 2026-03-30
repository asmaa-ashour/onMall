import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';
import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';

class AuthData {
  Crud crud;
  AuthData(this.crud);

  /// SIGN UP
  signup(String name, String email, String password, String phone) async {
    var response = await crud.postData(
      AppLink.signUp,
      {
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phone,
      },
      "", // ما في توكن هون
    );

    return response.fold((l) => l, (r) => r);
  }

login(String email, String password) async {
  var response = await crud.postData(
    AppLink.login,
    {
      "email": email,
      "password": password,
    },
    "",
  );

  return response.fold(
    (l) {
      // لو في خطأ بالشبكة أو السيرفر
      print("Login error: $l");
      return null; // أو throw Exception
    },
    (r) {
      // تحقق من أنه Map قبل الإرجاع
      if (r is Map<String, dynamic>) {
        return r;
      } else {
        print("Unexpected login response type: ${r.runtimeType}");
        return null;
      }
    },
  );
}
  /// VERIFY OTP
  Future<dynamic> verifyOtp(String email, String code) async {
    var response = await crud.postData(
      AppLink.verifycodessignup, // الرابط من link_api.dart
      {
        "email": email,
        "otp": code,
      },
      "", // لا يوجد توكن أول مرة
    );

    return response.fold((l) => l, (r) => r);
  }
}