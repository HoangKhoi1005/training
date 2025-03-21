import 'package:training/example/class/abstract_interface.dart';

void main() async {
  final password = 'password';
  final userName = 'userName';
  final loginAction = LoginAction(password: password, userName: userName);

  final user = await loginAction.login();
  print('User username ${user.fullName}');
  print('User dob ${user.dob}');
}

abstract mixin class LoginMixin {
  String get userName;

  String get password;

  Future<User> login() async {
    final body = {
      'user_name': userName,
      'password': password,
    };
    final dob = DateTime.now();
    final fullName = 'Full name';
    return TestUser(dob: dob, fullName: fullName);
  }
}

final class LoginAction with LoginMixin {
  const LoginAction({
    required this.password,
    required this.userName,
  });

  @override
  final String password;

  @override
  final String userName;
}
