part of my_domain;

abstract class UserRepository {
  const UserRepository();

  Future<User> login({required String userName, required String password});
  Future<User> signUp({required String firstName, required String lastName, required String email, required String password});
}
