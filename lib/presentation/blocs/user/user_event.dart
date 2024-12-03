sealed class UserEvent {
  const UserEvent();
}

final class UserInitial extends UserEvent {}

final class UserLoaded extends UserEvent {
  //UserLoaded({required int id});
}
