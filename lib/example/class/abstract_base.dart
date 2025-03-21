import 'dart:convert';

import 'package:training/example/class/abstract.dart';

void main() {
  ///
}

abstract base class LoginRepository {
  const LoginRepository();

  Future<User> login(String username, String password);

  Future<User> getUser(String token);

  /// Helper function - dùng chung để hỗ trợ những việc cơ bản
  String? _jsonEncode(Map body) {
    try {
      /// Encode map -> json String
      return jsonEncode(body);
    } catch (e) {
      print(e);
    }
    return null;
  }
}

final class LoginRepositoryImpl extends LoginRepository {
  const LoginRepositoryImpl();

  @override
  Future<User> getUser(String token) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<User> login(String username, String password) {
    final body = {
      'username': username,
      'password': password,
    };
    final json = _jsonEncode(body);

    /// -> Send JSON request
    // TODO: implement login
    throw UnimplementedError();
  }
}
