abstract class SplashState {}

class DisplaySplash extends SplashState {}

class Authenticated extends SplashState {
  final Map<String, dynamic> userData;

  Authenticated(this.userData);
}

class NetworkError extends SplashState {}

class UnAuthenticated extends SplashState {}
