import 'package:floor/floor.dart';
import 'package:my_app/src/core/utiles/constants.dart';
import 'package:my_app/src/domain/models/my_source_model.dart';


@Entity(tableName: kArticlesTableName)
class MyArticleModel {
  @primaryKey
  final int? id;

  final MySourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  // ignore: sort_constructors_first
  MyArticleModel({
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });


  // ignore: sort_constructors_first
  factory MyArticleModel.fromJson(Map<String, dynamic> map) {
    return MyArticleModel(
      source: MySourceModel.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      url: map['url'] as String?,
      urlToImage: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] as String?,
      content: map['content'] as String?,
    );
  }



}
