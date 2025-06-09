part of my_domain;

@freezed
interface class User with _$User {
  @override
  final String fullName;

  @override
  final DateTime? dob;

  @override
  final String phoneNo;

  const User({
    required this.fullName,
    required this.dob,
    required this.phoneNo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'] as String,
      dob: json['dob'] != null ? DateTime.parse(json['dob'] as String) : null,
      phoneNo: json['phoneNo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'dob': dob?.toIso8601String(),
      'phoneNo': phoneNo,
    };
  }
}
