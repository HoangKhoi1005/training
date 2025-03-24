part of my_domain;

sealed class DomainException implements Exception {
  const DomainException({
    required this.message,
  });

  final String message;
}
