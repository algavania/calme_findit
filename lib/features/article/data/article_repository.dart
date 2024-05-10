
import 'package:calme/data/models/article/article_model.dart';

abstract class ArticleRepository {
  Future<List<ArticleModel>> getArticles();
}