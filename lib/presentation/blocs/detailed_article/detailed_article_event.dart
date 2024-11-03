part of 'detailed_article_bloc.dart';

abstract class DetailedArticleEvent extends Equatable {
  const DetailedArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadDetailedArticle extends DetailedArticleEvent {
  final Article article;

  const LoadDetailedArticle(this.article);

  @override
  List<Object> get props => [article];
}
