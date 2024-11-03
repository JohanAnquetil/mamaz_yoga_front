part of 'detailed_article_bloc.dart';

abstract class DetailedArticleState extends Equatable {
  const DetailedArticleState();

  @override
  List<Object?> get props => [];
}

final class DetailedArticleInitial extends DetailedArticleState {
  @override
  List<Object?> get props => [];
}

class DetailedArticleLoading extends DetailedArticleState {
  @override
  List<Object?> get props => [];
}

class DetailedArticleLoaded extends DetailedArticleState {
  final Article article;

  const DetailedArticleLoaded(this.article);

  @override
  List<Object?> get props => [article];
}

class DetailedArticleLoadingFailure extends DetailedArticleState {
  final Object? exception;

  const DetailedArticleLoadingFailure(this.exception);

  @override
  List<Object?> get props => [exception];
}
