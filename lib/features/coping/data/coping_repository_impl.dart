import 'package:calme/data/models/coping/coping_model.dart';
import 'package:calme/database/db_helper.dart';
import 'package:calme/features/coping/data/coping_repository.dart';

class CopingRepositoryImpl extends CopingRepository {
  final db = DbHelper.db;

  @override
  Future<List<CopingModel>> getCopings() async {
    final list = <CopingModel>[];
    final snapshot = await db.collection(DbHelper.copings).get();
    for (final data in snapshot.docs) {
      var model = CopingModel.fromJson(data.data());
      model = model.copyWith(id: data.id);
      list.add(model);
    }
    return list;
  }

}