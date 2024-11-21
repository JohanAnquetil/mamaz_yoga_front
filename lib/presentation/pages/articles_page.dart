import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mamaz_yoga/presentation/routes/routes.gr.dart';
import 'package:mamaz_yoga/presentation/widgets/error_widget.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_app_bar.dart';
import '../../domain/articles/repositories/articles_remote_data_source.dart';
import '../../data/articles/models/article.dart';
import '../../init_config.dart';
import '../widgets/list_items.dart';
import '../widgets/list_item.dart';

@RoutePage()
class ArticlesPage extends StatefulWidget {
  static const route = '/articles';

  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  // late final ArticlesBloc _articlesBloc;
  // final ArticlesRemoteDataSource apiService = getIt<ArticlesRemoteDataSource>();
  // final Completer<void> _refreshCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    // _articlesBloc = getIt<ArticlesBloc>();
    // _articlesBloc.add(const LoadArticles());
    // Intl.defaultLocale = 'fr_FR';
    // initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return const Text("articles");
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   print(apiService);
  //   print(_articlesBloc);
  //   return Scaffold(
  //     appBar: const CustomAppBar(
  //       title: 'ARTICLES',
  //       leading: false,
  //     ),
  //     body: RefreshIndicator(
  //       onRefresh: () async {
  //         _articlesBloc
  //             .add(ArticlesEvent.loadArticles(completer: _refreshCompleter));
  //         return _refreshCompleter.future;
  //       },
  //       child: BlocBuilder<ArticlesBloc, ArticlesState>(
  //         bloc: _articlesBloc,
  //         builder: (context, state) {
  //           return state.when(
  //             initial: () => const Center(child: CircularProgressIndicator()),
  //             loading: () => const Center(child: CircularProgressIndicator()),
  //             loaded: (articlesList) {
  //               final modifiableList = List<Article>.from(articlesList);
  //               return ListItems<Article>(
  //                 items: modifiableList,
  //                 itemBuilder: (article) {
  //                   return GestureDetector(
  //                     onTap: () => AutoRouter.of(context).push(
  //                       DetailedArticleRoute(article: article),
  //                     ),
  //                     child: ListItem(
  //                       date: DateTime.parse(article.date),
  //                       image: article.image ?? '',
  //                       title: article.title,
  //                     ),
  //                   );
  //                 },
  //                 dateSelector: (article) => article.date,
  //               );
  //             },
  //             loadingFailure: (error) => ErrorWidgetWithRetry(
  //               errorMessage: "Erreur de chargement d'articles",
  //               onRetry: () => _articlesBloc.add(const LoadArticles()),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
  // }
