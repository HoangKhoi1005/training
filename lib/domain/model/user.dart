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

  User copyWith({
    String? fullName,
    DateTime? dob,
    String? phoneNo,
  }) {
    return User(
      fullName: fullName ?? this.fullName,
      dob: dob ?? this.dob,
      phoneNo: phoneNo ?? this.phoneNo,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'dob': dob?.toIso8601String(),
      'phoneNo': phoneNo,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'] as String,
      dob: json['dob'] != null ? DateTime.parse(json['dob'] as String) : null,
      phoneNo: json['phoneNo'] as String,
    );
  }
}
