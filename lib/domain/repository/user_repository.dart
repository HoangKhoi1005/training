part of my_domain;

abstract class UserRepository {
  const UserRepository();

  Future<User> login({required String userName, required String password});
}
