import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.getRequest(AppLink.test, {}, {});
    //print("$response.................data");
    return response.fold((l) => l, (r) => r);
  }
}
