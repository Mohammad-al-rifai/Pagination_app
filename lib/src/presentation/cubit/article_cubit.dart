import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:my_app/src/core/params/article_request.dart';
import 'package:my_app/src/core/resources/data_state.dart';
import 'package:my_app/src/domain/models/my_article_model.dart';
import 'package:my_app/src/domain/repositories/articles_repository.dart';

part 'article_state.dart';

@injectable
class ArticleCubit extends Cubit<ArticleStates> {
  ArticleCubit(this._articlesRepository) : super(ArticleInitialState());

  final ArticlesRepository _articlesRepository;

  final List<MyArticleModel> articles = [];
  int page = 1;
  static const int pageSize = 20;

  bool noMoreData = false;

  getArticles() async {
    if (noMoreData) {
      return;
    }
    if (articles.isEmpty) {
      emit(const ArticleLoadingState());
    }
    final dataState = await _articlesRepository.getBreakingNewsArticles(
      ArticlesRequestParams(
        page: page,
      ),
    );
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print(articles.length);
      final article = dataState.data;
      noMoreData = article!.length < pageSize;
      articles.addAll(article);
      print(articles.length);
      page++;

      emit(ArticleDoneState(articles, noMoreData: noMoreData));
    }

    if (dataState is DataFailed) {
      emit(ArticleErrorState(dataState.error!));
    }
  }
}
