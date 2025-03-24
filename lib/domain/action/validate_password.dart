part of my_domain;

mixin class ValidatePassword {
  String? validatePassword(String password) {
    const passwordMinLength = 6;
    if (password.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    } else if (password.length < passwordMinLength) {
      return 'Vui lòng nhập mật khẩu ít nhất $passwordMinLength ký tự';
    }
  }
}
