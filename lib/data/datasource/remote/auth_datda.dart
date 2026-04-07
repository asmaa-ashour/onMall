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
    null, // ✅ بدون توكن
  );

  return response.fold(
    (l) => l, // الخطأ سيظهر في Snackbar مباشرة من postData
    (r) => r,
  );
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
 
}