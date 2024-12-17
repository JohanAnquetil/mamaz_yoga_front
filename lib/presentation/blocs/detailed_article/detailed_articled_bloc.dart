import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/data/articles/models/article.dart';
import 'package:mamaz_yoga/domain/articles/usecases/get_articles.dart';
import 'package:mamaz_yoga/init_config.dart';
import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_article_events.dart';
import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_article_state.dart';

class DetailedArticleBloc
    extends Bloc<DetailedArticleEvent, DetailedArticleState> {
  DetailedArticleBloc() : super(const DetailedArticleState.unknown()) {
    on<DetailedArticlesLoadingEvent>(_onLoadDetailedArticle);
  }

  Future<void> _onLoadDetailedArticle(DetailedArticlesLoadingEvent event,
      Emitter<DetailedArticleState> emit) async {
    emit(
      DetailedArticleState.loading(),
    );
    final int id = event.id;
    var article = await getIt<GetArticleUseCase>().call(id);

    article.fold(
      (error) => {
        emit(
          DetailedArticleState.failure(error),
        )
      },
      (success) {
        final articleModel =
            ArticleDetailedModel.fromJson(success['data']).toEntity();
        print("lii ${success['data']}");
        print("success in detailed article: $articleModel");
        emit(
          DetailedArticleState.loaded(
            articleModel,
          ),
        );
      },
    );
  }
}
