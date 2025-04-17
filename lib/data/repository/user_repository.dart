part of my_data;

final class UserRepositoryImpl extends UserRepository {
  const UserRepositoryImpl({
    required this.userService,
  });

  final UserService userService;

  @override
  Future<User> login({
    required String userName,
    required String password,
  }) {
    return userService
        .login(userName: userName, password: password)
        .then((dto) {
      final user = User(
        fullName: dto.user.name,
        dob: null,
        phoneNo: dto.user.phone,
      );
      return user;
    });
  }

  @override
  Future<User> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
