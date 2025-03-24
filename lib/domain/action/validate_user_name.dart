part of my_domain;

mixin class ValidateUserName {
  String? validateUserName(String userName) {
    const userNameMinLength = 6;
    if (userName.isEmpty) {
      return 'Vui lòng nhập tên đăng nhập';
    } else if (userName.length < userNameMinLength) {
      return 'Vui lòng tên đăng nhập ít nhất $userNameMinLength ký tự';
    } else if (userName.contains('@')) {
      return 'Tên đăng nhập không chứa ký tự đặc biệt';
    }
  }
}
