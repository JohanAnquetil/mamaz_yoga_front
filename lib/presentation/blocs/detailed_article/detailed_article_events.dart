sealed class DetailedArticleEvent {
  const DetailedArticleEvent();
}

class DetailedArticlesInitialEvent extends DetailedArticleEvent {}

class DetailedArticlesLoadingEvent extends DetailedArticleEvent {
  final int id;

  const DetailedArticlesLoadingEvent(this.id);
}

class DetailedArticleLoadedEvent extends DetailedArticleEvent {}

class DetailedArticleEventFailureEvent extends DetailedArticleEvent {}
