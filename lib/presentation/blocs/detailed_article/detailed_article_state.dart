import 'package:equatable/equatable.dart';
import '../../../domain/articles/entities/detailed_article.dart';
import 'detailed_article_status.dart';

class DetailedArticleState extends Equatable {
  final DetailedArticleStatus status;
  final DetailedArticleEntitiy article;
  final String? errorMessage;

  const DetailedArticleState._({
    this.status = DetailedArticleStatus.initial,
    this.article = DetailedArticleEntitiy.emptyArticle,
    this.errorMessage,
  });

  const DetailedArticleState.unknown() : this._();

  const DetailedArticleState.initial()
      : this._(status: DetailedArticleStatus.initial);

  const DetailedArticleState.loading()
      : this._(status: DetailedArticleStatus.loading);

  const DetailedArticleState.loaded(var article)
      : this._(status: DetailedArticleStatus.loaded, article: article);

  const DetailedArticleState.failure(String message)
      : this._(errorMessage: message);

  @override
  List<Object?> get props => [
        status,
        article,
        errorMessage,
      ];
}
