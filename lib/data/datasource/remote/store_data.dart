import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';

class StoreData {
  Crud crud;
  StoreData(this.crud);

  Future getData(int areaId) async {
    var response = await crud.getRequest(
      AppLink.store + "$areaId", // 🔥 حسب API تبعك
      {},
      null,
    );

    return response.fold((l) => l, (r) => r);
  }
}
