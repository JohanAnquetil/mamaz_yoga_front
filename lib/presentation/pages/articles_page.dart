import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/domain/articles/entities/article.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_event.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_state.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_status.dart';
import 'package:mamaz_yoga/presentation/routes/routes.gr.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_app_bar.dart';
import 'package:mamaz_yoga/presentation/widgets/list_item.dart';
import 'package:mamaz_yoga/presentation/widgets/list_items.dart';

@RoutePage()
class ArticlesPage extends StatelessWidget {
  static const route = '/articles';

  ArticlesPage({super.key});

  late final ArticlesBloc _articlesBloc;
  final Completer<void> _refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state.status == ArticlesStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == ArticlesStatus.loaded) {
          print("articleTitle: ${state.articleEntity.first.id}");
          return RefreshIndicator(
              onRefresh: () async {
                _articlesBloc
                    .add(ArticlesLoadingEvent(completer: _refreshCompleter));
                return _refreshCompleter.future;
              },
              child: Scaffold(
                appBar: CustomAppBar(),
                body: ListItems(
                  items: state.articleEntity,
                  itemBuilder: (ArticleEntity article) {
                    return GestureDetector(
                      onTap: () {
                        print("tap:${article.id}");
                        AutoRouter.of(context).push(
                          DetailedArticleRoute(id: article.id),
                        );
                      },
                      child: ListItem(
                        date: DateTime.parse(article.date),
                        image: article.image ?? '',
                        title: article.title,
                      ),
                    );
                  },
                  dateSelector: (article) => article.date,
                ),
              ));
        }

        if (state.status == ArticlesStatus.failure) {
          return Center(
            child: Text(
              'An error occurred: ${state.errorMessage ?? 'Unknown error'}',
            ),
          );
        }

        return Text("Unexpected state");
      },
    );
  }
}
