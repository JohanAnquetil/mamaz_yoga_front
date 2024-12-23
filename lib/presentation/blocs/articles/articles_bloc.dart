import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/news/models/articles_list.dart';
import '../../../domain/articles/usecases/get_articles.dart';
import '../../../init_config.dart';
import 'articles_event.dart';
import 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvents, ArticlesState> {
  ArticlesBloc() : super(const ArticlesState.unknown()) {
    on<ArticlesLoadingEvent>(_onArticlesBloc);
  }

  Future<void> _onArticlesBloc(
      ArticlesLoadingEvent event, Emitter<ArticlesState> emit) async {
    emit(ArticlesState.loading());

    var result = await getIt<GetArticlesUseCase>().call();
    print("result in articles bloc: $result");
    result.fold(
        (failure) => {print("failure"), emit(ArticlesState.failure(failure))},
        (success) {
      print("success");
      print("${(success['posts'] as List).map((json) => json).toList()}");
      emit(ArticlesState.loaded(
        (success['posts'] as List)
            .map((json) => ArticleModel.fromJson(json).toEntity())
            .toList()
          ..sort((a, b) =>
              DateTime.parse(b.date).compareTo(DateTime.parse(a.date))),
      ));
    });
    if (event.completer != null && !event.completer!.isCompleted) {
      event.completer!.complete();
    }
  }
}
