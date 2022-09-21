import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/src/data/data_sources/remote/news_api_service.dart';
import 'package:my_app/src/domain/models/my_article_model.dart';

import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../domain/repositories/articles_repository.dart';

@LazySingleton(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;

  // ignore: sort_constructors_first
  const ArticlesRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<MyArticleModel>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  ) async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey,
        country: params.country,
        category: params.category,
        page: params.page,
        pageSize: params.pageSize,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
