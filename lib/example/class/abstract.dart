void main() {
  /// Trừu tượng hoá (abstract): dùng để định nghĩa phương thức, thuộc tính mà
  /// mình mong muốn class sẽ có nhưng không đặt nặng vấn đề hiện thực hoá (implement)
  ///
  ///
  final username = 'username';
  final password = '123123';
  final loginService = TestLoginService();
  final user = doLogin(
    username: username,
    password: password,
    loginService: loginService,
  );
  print('User: ${user.fullName} - ${user.dateOfBirth}');

  final wrongUser = doLogin(
    username: '',
    password: '',
    loginService: loginService,
  );
}

User doLogin({
  required String username,
  required String password,
  required LoginService loginService,
}) {
  /// Show loading
  final user = loginService.login(username, password);

  /// Hide loading
  /// Handle exception -> wrong password
  /// Handle login result -> save login token
  /// Handle user info -> prepare data
  return user;
}

class TestLoginService extends LoginService {
  @override
  User login(String username, String password) {
    if (username == 'username') {
      return User(fullName: 'My full name', dateOfBirth: DateTime.now());
    }
    throw ArgumentError('Wrong information');
  }
}

abstract class LoginService {
  const LoginService();

  User login(String username, String password);
}

class User {
  const User({
    required this.fullName,
    required this.dateOfBirth,
  });

  final String fullName;

  final DateTime dateOfBirth;
}
