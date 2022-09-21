
import 'package:my_app/src/core/utiles/constants.dart';

class ArticlesRequestParams {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  // ignore: sort_constructors_first
  const ArticlesRequestParams({
    this.apiKey = kApiKey,
    this.country = 'us',
    this.category = 'general',
    this.page = 1,
    this.pageSize = 20,
  });
}
