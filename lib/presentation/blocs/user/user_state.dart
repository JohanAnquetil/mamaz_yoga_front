import 'package:equatable/equatable.dart';
import '../../../domain/user/entities/user.dart';
import 'user_status.dart';

class UserState extends Equatable {
  final UserStatus status;
  final UserEntity user;
  final String? errorMessage;

  const UserState._({
    this.status = UserStatus.initial,
    this.user = UserEntity.emptyUser,
    this.errorMessage,
  });
  const UserState.unknown() : this._();

  const UserState.authenticated(UserEntity user)
      : this._(
          status: UserStatus.authenticated,
          user: user,
        );

  const UserState.unauthenticated()
      : this._(status: UserStatus.unauthenticated);

  const UserState.loading() : this._(status: UserStatus.loading);

  const UserState.error(String message)
      : this._(
          status: UserStatus.error,
          errorMessage: message,
        );

  @override
  List<Object?> get props => [status, user, errorMessage];
}
