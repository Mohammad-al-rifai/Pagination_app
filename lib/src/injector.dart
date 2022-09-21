import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/src/core/utiles/constants.dart';
import 'package:my_app/src/data/data_sources/remote/news_api_service.dart';
import 'package:my_app/src/injector.config.dart';

final injector = GetIt.instance;

@InjectableInit()
GetIt init() => $initGetIt(injector);

@module
abstract class RegisterModule {
  NewsApiService getService(Dio client) =>
      NewsApiService(client, baseUrl: kBaseUrl);

  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          connectTimeout: 600000,
          receiveDataWhenStatusError: true,
          receiveTimeout: 600000,
        ),
      );
}
