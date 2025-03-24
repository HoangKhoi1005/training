part of my_domain;

class ValidationException extends DomainException {
  const ValidationException({
    required super.message,
  }) : super();
}
