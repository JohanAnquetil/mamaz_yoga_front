import 'dart:async';

sealed class ArticlesEvents {
  const ArticlesEvents();
}

class ArticlesInitialEvent extends ArticlesEvents {}

class ArticlesLoadingEvent extends ArticlesEvents {
  final Completer? completer;
  const ArticlesLoadingEvent({this.completer});
}

class ArticlesLoadedEvent extends ArticlesEvents {}

class ArticlesFailureEvent extends ArticlesEvents {}
