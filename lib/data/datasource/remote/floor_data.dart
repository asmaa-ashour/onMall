import 'package:second/core/class/crud.dart';
import 'package:second/data/model/floorModel.dart';
import 'package:second/link_api.dart';

class FloorData {
  Crud crud;
  FloorData(this.crud);

  Future<List<FloorsModel>> getFloors() async {
    final responseEither = await crud.getRequest(AppLink.floors, {}, {});

    return responseEither.fold(
      (l) {
        print("ERROR");
        return [];
      },
      (r) {
        print("RUNTIME TYPE: ${r.runtimeType}");

        if (r is List) {
          return r.map((e) => FloorsModel.fromJson(e)).toList();
        } else {
          print("NOT LIST ❌");
          return [];
        }
      },
    );
  }
}
