
import 'package:injectable/injectable.dart';
import 'package:my_app/src/domain/models/my_article_model.dart';

import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';



abstract class ArticlesRepository {
  Future<DataState<List<MyArticleModel>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  );
}
