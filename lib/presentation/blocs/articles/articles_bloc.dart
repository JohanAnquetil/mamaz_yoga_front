import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_sources/remote/articles/articles_remote_data_source.dart';
import '../../../domain/entities/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_event.dart';

part 'articles_state.dart';

part 'articles_bloc.freezed.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesRemoteDataSource articlesRepository;

  ArticlesBloc(this.articlesRepository) : super(const ArticlesState.initial()) {
    on<LoadArticles>((event, emit) async {
      try {
        if (state is! ArticlesLoaded) {
          emit(const ArticlesLoading());
        }
        final articlesList = await articlesRepository.getArticles();
        emit(ArticlesState.loaded(List<Article>.from(articlesList)));
      } catch (e) {
        emit(
          ArticlesState.loadingFailure(e),
        );
      } finally {
        if (event.completer != null && !event.completer!.isCompleted) {
          event.completer?.complete();
        }
      }
    });
  }
}
