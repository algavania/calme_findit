import 'package:calme/data/models/article/article_model.dart';
import 'package:calme/database/db_helper.dart';
import 'package:calme/features/article/data/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final db = DbHelper.db;

  @override
  Future<List<ArticleModel>> getArticles() async {
    final list = <ArticleModel>[];
    final snapshot = await db.collection(DbHelper.articles).get();
    for (final data in snapshot.docs) {
      var model = ArticleModel.fromJson(data.data());
      model = model.copyWith(id: data.id);
      list.add(model);
    }
    return list;
  }
}
