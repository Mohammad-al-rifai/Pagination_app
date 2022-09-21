// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/config/themes/app_themes.dart';
import 'package:my_app/src/core/utiles/constants.dart';
import 'package:my_app/src/presentation/cubit/article_cubit.dart';

import 'src/config/routes/app_routes.dart';
import 'src/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleCubit>(
      create: (_) => injector<ArticleCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
      ),
    );
  }
}
