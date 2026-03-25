import 'package:second/core/class/crud.dart';
import 'package:second/link_api.dart';

class AreaData {
  Crud crud;
  AreaData(this.crud);

  getData() async {
    var response = await crud.getRequest(
      AppLink.area + "${1}/areas",
      {},
      null,
    );

    return response.fold((l) => l, (r) => r);
  }
}
