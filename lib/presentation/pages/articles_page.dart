import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
