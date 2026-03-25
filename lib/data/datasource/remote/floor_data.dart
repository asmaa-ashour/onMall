import 'package:second/core/class/crud.dart';
import 'package:second/data/model/floorModel.dart';

class FloorData {
  Crud crud;
  FloorData(this.crud);

  Future<List<FloorModel>> getFloors() async {
    final responseEither = await crud
        .getRequest("http://192.168.1.104:8050/api/getAllFloors", {}, {});

    return responseEither.fold(
      // لو حصل خطأ → رجع قائمة فارغة
      (l) => [],
      // لو نجح → حول البيانات
      (r) {
        // r هنا من النوع Map
        List floorsJson = r['floors'] ?? [];
        return floorsJson.map((e) => FloorModel.fromJson(e)).toList();
      },
    );
  }
}
