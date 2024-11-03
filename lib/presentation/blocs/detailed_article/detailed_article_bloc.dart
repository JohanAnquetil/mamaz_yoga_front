import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/article.dart';

part 'detailed_article_event.dart';

part 'detailed_article_state.dart';

class DetailedArticleBloc
    extends Bloc<DetailedArticleEvent, DetailedArticleState> {
  DetailedArticleBloc() : super(DetailedArticleInitial()) {
    on<LoadDetailedArticle>(_onLoadDetailedArticle);
  }

  Future<void> _onLoadDetailedArticle(
      LoadDetailedArticle event, Emitter<DetailedArticleState> emit) async {
    try {
      if (state is! DetailedArticleLoaded) {
        emit(DetailedArticleLoading());
      }
      emit(DetailedArticleLoaded(event.article));
    } catch (e) {
      emit(DetailedArticleLoadingFailure(e));
    }
  }
}
