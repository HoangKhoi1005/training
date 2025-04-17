part of my_domain;

class SignUp with ValidateEmail, ValidatePassword, ValidateUserName {
  const SignUp({
    required this.userRepository,
    required this.myApplication,
});

  final UserRepository userRepository;
  final MyApplication myApplication;

  Future<void> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
}) async {
    try {
      // Validate if email is valid
      final emailErrorMessage = validateEmail(email);
      if (emailErrorMessage != null) {
        throw EmailException(
          input: email,
          message: emailErrorMessage,
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

      // Validate if user name is valid
      final userNameErrorMessage = validateUserName(firstName);
      if (userNameErrorMessage != null) {
        throw UsernameException(
          input: firstName,
          message: userNameErrorMessage,
        );
      }

      /// Gọi đến REPOSITORY để lấy dữ liệu
      await userRepository.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
    } catch (e, s) {
      ///
      print(e);
      rethrow;
    }
  }
}