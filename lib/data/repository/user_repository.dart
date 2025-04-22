part of my_data;

final class UserRepositoryImpl extends UserRepository {
  const UserRepositoryImpl({
    required this.userService,
  });

  final UserService userService;

  @override
  Future<String> login({
    required String userName,
    required String password,
  }) {
    return userService
        .login(userName: userName, password: password)
        .then((dto) {
      final token = dto.token;
      return token;
    });
  }

  @override
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<User> getUser({required String token}) {
    return userService.getAccountInfo(token: token).then((dto) {
      final user = dto.user;
      final fullName = user.name;
      final dob = null;
      final phoneNo = user.phone;
      final result = User(fullName: fullName, dob: dob, phoneNo: phoneNo);
      return result;
    });
  }
}
