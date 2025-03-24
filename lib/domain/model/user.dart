part of my_domain;

interface class User {
  const User({
    required this.fullName,
    required this.dob,
    required this.phoneNo,
  });

  final String fullName;

  final DateTime? dob;

  final String phoneNo;
}
