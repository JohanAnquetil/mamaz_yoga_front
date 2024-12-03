abstract class SplashState {}

class DisplaySplash extends SplashState {}

class Authenticated extends SplashState {
  final Map<String, dynamic> userData;

  Authenticated(this.userData);
}

class UnAuthenticated extends SplashState {}
