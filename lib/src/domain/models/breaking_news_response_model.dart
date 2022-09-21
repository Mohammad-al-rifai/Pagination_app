// ignore_for_file: sort_constructors_first

import 'package:my_app/src/domain/models/my_article_model.dart';

class BreakingNewsResponseModel {
  final String? status;
  final int? totalResults;
  final List<MyArticleModel>? articles;

  BreakingNewsResponseModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsResponseModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: List<MyArticleModel>.from(
        (json['articles'] as List<dynamic>).map(
          (e) => MyArticleModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );
  }
}
