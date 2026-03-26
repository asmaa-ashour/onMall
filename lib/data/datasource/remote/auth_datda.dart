import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';

class AuthData {
  Crud crud;
  AuthData(this.crud);

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
}
