part of my_domain;

final class UsernameException extends ValidationException {
  UsernameException({
    required this.input,
    required super.message,
  });

  final String input;
}
