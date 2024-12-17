import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_state.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_state.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_status.dart';
import 'package:mamaz_yoga/presentation/routes/routes.gr.dart';
import 'package:mamaz_yoga/presentation/theme/app_theme.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  static const route = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Container color: ${Theme.of(context).scaffoldBackgroundColor}");
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          print("state: $state");
          if (state.status == UserStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == UserStatus.authenticated) {
            return BlocBuilder<ArticlesBloc, ArticlesState>(
              builder: (context, articleState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome ${state.user.displayName}',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Text(
                                  'Derniers articles',
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          height: 3,
                        ),
                      ),
                      SizedBox(
                        height: 350,
                        child: articleState.articleEntity.isNotEmpty
                            ? ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final article =
                                      articleState.articleEntity[index];
                                  return GestureDetector(
                                    onTap: () {
                                      print("tap:${article.id}");
                                      AutoRouter.of(context).push(
                                        DetailedArticleRoute(id: article.id),
                                      );
                                    },
                                    child: SizedBox(
                                      height: 350,
                                      width: 300,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 7.0),
                                              child: Text(
                                                DateFormat('d MMMM yyyy')
                                                    .format(DateTime.parse(
                                                        article.date))
                                                    .toString(),
                                                style: AppTheme
                                                    .textTheme.bodySmall,
                                              ),
                                            ),
                                            Card(
                                                color: AppTheme.pinkColor,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      height: 170,
                                                      width: double.infinity,
                                                      child: Image.network(
                                                        article.image ?? "",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 15),
                                                      child: SizedBox(
                                                        height: 100,
                                                        child: Text(
                                                          style: AppTheme
                                                              .textTheme
                                                              .bodySmall,
                                                          article.title,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : Container(),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          if (state.status == UserStatus.unauthenticated) {
            return const Center(
              child: Text('Please log in to continue.'),
            );
          }

          if (state.status == UserStatus.error) {
            return Center(
              child: Text(
                  'An error occurred: ${state.errorMessage ?? 'Unknown error'}'),
            );
          }

          // État inattendu (optionnel, pour le débogage)
          return const Center(
            child: Text('Unexpected state.'),
          );
        },
      ),
    );
  }
}
