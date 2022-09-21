// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/data_sources/remote/news_api_service.dart' as _i4;
import 'data/repositories/articles_repository_impl.dart' as _i6;
import 'domain/repositories/articles_repository.dart' as _i5;
import 'injector.dart' as _i8;
import 'presentation/cubit/article_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio());
  gh.factory<_i4.NewsApiService>(
      () => registerModule.getService(get<_i3.Dio>()));
  gh.lazySingleton<_i5.ArticlesRepository>(
      () => _i6.ArticlesRepositoryImpl(get<_i4.NewsApiService>()));
  gh.factory<_i7.ArticleCubit>(
      () => _i7.ArticleCubit(get<_i5.ArticlesRepository>()));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
