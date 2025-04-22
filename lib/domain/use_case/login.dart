part of my_domain;

final class Login with ValidateUserName, ValidatePassword {
  const Login({
    required this.userRepository,
    required this.myApplication,
  });

  final UserRepository userRepository;
  final MyApplication myApplication;

  Future<String> call({
    required String userName,
    required String password,
    int count = 0,
  }) async {
    try {
      // Validate if user name is valid
      final userNameErrorMessage = validateUserName(userName);
      if (userNameErrorMessage != null) {
        throw UsernameException(
          input: userName,
          message: userNameErrorMessage,
        );
      }

      // Validate if password is valid
      final passwordErrorMessage = validatePassword(password);
      if (passwordErrorMessage != null) {
        throw PasswordException(
          input: password,
          message: passwordErrorMessage,
        );
      }

      // /// Gọi đến REPOSITORY để lấy dữ liệu
      final token = await userRepository.login(
        userName: userName,
        password: password,
      );
      return token;
    } on ExpiredPasswordException catch (e, s) {
      if (count > 1) {
        rethrow;
      }

      /// Redirect to change new password screen
      final newPassword = await myApplication.updateNewPassword();
      final user = await call(
        userName: userName,
        password: newPassword,
        count: count + 1,
      );
      return user;
    } catch (e, s) {
      ///
      print(e);
      rethrow;
    }
  }
}

// void main() async {
//   final login = Login(
//     userRepository: userRepository,
//     myApplication: myApplication,
//   );
//   final user = await login(userName: 'jser', password: 'pass');
//   ///...
// }
