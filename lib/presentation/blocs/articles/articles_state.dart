import 'package:equatable/equatable.dart';
import '../../../domain/articles/entities/article.dart';
import 'articles_status.dart';

class ArticlesState extends Equatable {
  final ArticlesStatus status;
  final List<ArticleEntity> articleEntity;
  final String? errorMessage;

  const ArticlesState._({
    this.status = ArticlesStatus.initial,
    this.articleEntity = const [],
    this.errorMessage,
  });

  const ArticlesState.unknown() : this._();

  const ArticlesState.initial() : this._();

  const ArticlesState.loading() : this._(status: ArticlesStatus.loading);

  const ArticlesState.loaded(List<ArticleEntity> articles)
      : this._(status: ArticlesStatus.loaded, articleEntity: articles);

  const ArticlesState.failure(String message) : this._(errorMessage: message);

  @override
  List<Object?> get props => [status, articleEntity, errorMessage];
}
