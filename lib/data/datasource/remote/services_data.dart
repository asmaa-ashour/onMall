import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';

class ServiceData {
  Crud crud;
  ServiceData(this.crud);

  Future getData(int areaId) async {
    var response = await crud.getRequest(
      AppLink.service + "$areaId", // 🔥 حسب API
      {},
      null,
    );

    return response.fold((l) => l, (r) => r);
  }
}
