part of my_domain;

sealed class DomainException implements Exception {
  const DomainException({
    required this.message,
  });

  final String message;
}

class RepositoryException implements Exception {
  const RepositoryException({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;

  final String message;
}
