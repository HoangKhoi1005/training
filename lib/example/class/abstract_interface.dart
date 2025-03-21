export 'abstract.dart';

void main() {
  /// Tham khảo ví vụ cụ thể ở hàm [doLogin]
}

abstract interface class User {
  const User();

  String get fullName;

  String get phoneNo;

  DateTime? get dob;
}

final class TestUser implements User {
  const TestUser({
    required this.dob,
    required this.fullName,
    this.phone = '',
  });

  @override
  final DateTime? dob;

  @override
  final String fullName;

  final String phone;

  @override
  String get phoneNo => phone;
}
