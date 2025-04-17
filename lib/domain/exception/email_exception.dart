part of my_domain;

final class EmailException extends ValidationException {
  const EmailException({
    required this.input,
    required super.message,
  });

  final String input;
}