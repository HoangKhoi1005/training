part of my_domain;

mixin class ValidateEmail {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Vui lòng nhập email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return 'Email không hợp lệ';
    }
  }
}