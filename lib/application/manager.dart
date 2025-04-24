part of application;

final class ApplicationManager extends ChangeNotifier implements MyApplication {
  /// Singleton instance of ApplicationManager
  static final ApplicationManager _instance = ApplicationManager._internal();

  ApplicationManager._internal();
  factory ApplicationManager() {
    return _instance;
  }

  @override
  Future<String> updateNewPassword() {
    ///
    /// TODO: implement updateNewPassword
    return Future.value('updateNewPassword');
  }

  String _token = '';
  final tokenNotifier = ValueNotifier<String>('');
  String get token => _token;
  set token(String value) {
    if (value.isEmpty) {
      _token = '';
      _user = null;
      notifyListeners();
    } else if (value.length < 10) {
      throw Exception('Token is too short');
    } else if (value == _token) {
      return;
    } else if (_token != value) {
      _token = value;
      getProfile();
      notifyListeners();
    }
  }

  User? _user;
  User? get user => _user;

  Future<User> getProfile() {
    final token = this.token;
    final userFuture = _fetchProfile(token: token);
    userFuture.then((value) {
      _user = value;
    });
    return userFuture;
  }

  Future<User> _fetchProfile({required String token}) async {
    final repository = UserRepositoryImpl(
      userService: UserService(config: DevUserServiceConfig()),
    );
    return repository.getUser(token: token);
  }

  bool get isLoggedIn {
    return _token.isNotEmpty;
  }

  bool get isValidToken {
    /// Check if the token is valid, not expired, etc.
    final isExpired = false; // Replace with actual token expiration check
    final isValid = !isExpired;
    return isLoggedIn && isValid;
  }

  @override
  Future logout() async {
    token = '';
  }

  final favoriteButtonNotifier = ValueNotifier(true);
}
