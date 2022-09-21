import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_app/src/domain/models/my_article_model.dart';
import 'package:my_app/src/injector.dart';
import 'package:my_app/src/presentation/cubit/article_cubit.dart';

import '../widgets/article_widget.dart';

class BreakingNewsView extends StatefulWidget {
  const BreakingNewsView({super.key});

  @override
  State<BreakingNewsView> createState() => _BreakingNewsViewState();
}

class _BreakingNewsViewState extends State<BreakingNewsView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<ArticleCubit>().getArticles();

    scrollController.addListener(
      () {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;

        final ArticleCubit articleCubit = context.read<ArticleCubit>();

        final state = articleCubit.state;

        if (maxScroll == currentScroll) {
          articleCubit.getArticles();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(scrollController),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Ionicons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(ScrollController scrollController3) {
    return BlocConsumer<ArticleCubit, ArticleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        print(state.runtimeType);
        if (state is ArticleLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is ArticleErrorState) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is ArticleDoneState) {
          return _buildArticle(
            state.articles!,
            state.noMoreData!,
          );
        }
        return const SizedBox(
          height: 20.0,
        );
      },
    );
  }

  Widget _buildArticle(
    List<MyArticleModel> articles,
    bool noMoreData,
  ) {
    // return ListView.separated(
    //   controller: scrollController,
    //   itemBuilder: (context, index) => ArticleWidget(
    //     article: articles[index],
    //     onArticlePressed: (e) {},
    //   ),
    //   separatorBuilder: (context, index) => Container(
    //     width: double.infinity,
    //     height: 1.0,
    //     color: Colors.grey,
    //   ),
    //   itemCount: articles.length,
    // );
    return ListView(
      controller: scrollController,
      children: [
        // Items
        ...List<Widget>.from(
          articles.map(
            (e) => Builder(
              builder: (context) => ArticleWidget(
                article: e,
                onArticlePressed: (e) {},
              ),
            ),
          ),
        ),
        // add Loading (circular progress indicator at the end),
        // if there are more items to be loaded
        if (noMoreData) ...[
          const SizedBox(),
        ] else ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: CupertinoActivityIndicator(),
          ),
        ]
      ],
    );
  }
}
