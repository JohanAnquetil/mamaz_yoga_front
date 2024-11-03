part of 'articles_bloc.dart';

@freezed
class ArticlesState with _$ArticlesState {
  const factory ArticlesState.initial() = ArticlesInitial;

  const factory ArticlesState.loading() = ArticlesLoading;

  const factory ArticlesState.loaded(List<Article> articlesList) =
      ArticlesLoaded;

  const factory ArticlesState.loadingFailure(Object? exception) =
      ArticlesLoadingFailure;
}
