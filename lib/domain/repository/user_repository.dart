part of my_domain;

abstract class UserRepository {
  const UserRepository();

  Future<String> login({required String userName, required String password});

  Future<User> getUser({required String token});

  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
