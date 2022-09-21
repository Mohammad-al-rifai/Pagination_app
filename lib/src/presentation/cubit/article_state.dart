part of 'article_cubit.dart';

@immutable
abstract class ArticleStates {
  final List<MyArticleModel>? articles;
  final bool? noMoreData;
  final DioError? error;
  final bool? loading;

  // ignore: sort_constructors_first
  const ArticleStates(
      {this.articles, this.noMoreData, this.error, this.loading});
}

class ArticleInitialState extends ArticleStates {}

class ArticleLoadingState extends ArticleStates {
  const ArticleLoadingState();
}

class ArticleDoneState extends ArticleStates {
  const ArticleDoneState(
    List<MyArticleModel> article, {
    bool? noMoreData,
  }) : super(
          articles: article,
          noMoreData: noMoreData,
        );
}

class ArticleErrorState extends ArticleStates {
  const ArticleErrorState(DioError error)
      : super(
          error: error,
        );
}

class ArticleLoadedState extends ArticleStates {
  const ArticleLoadedState(
    List<MyArticleModel> article, {
    bool? loading,
  }) : super(
          articles: article,
          loading: loading,
        );
}
