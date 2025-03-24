part of my_domain;

base class PasswordException extends ValidationException {
  const PasswordException({
    required super.message,
    required this.input,
  });

  final String input;
}

final class ExpiredPasswordException extends PasswordException {
  const ExpiredPasswordException({
    required super.message,
    required super.input,
  });
}
