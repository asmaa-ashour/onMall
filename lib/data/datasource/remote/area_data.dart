import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';

class AreaData {
  Crud crud;
  AreaData(this.crud);

  Future getData(int floorId) async {
    var response = await crud.getRequest(
      AppLink.area + "$floorId",
      {},
      null,
    );

    return response.fold((l) => l, (r) => r);
  }
}
