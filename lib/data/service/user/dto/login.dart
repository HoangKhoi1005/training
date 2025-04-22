part of my_data;

@JsonSerializable()
final class UserServiceLoginDTO {
  static UserServiceLoginDTO fromJson(Map<String, dynamic> json) {
    return _$UserServiceLoginDTOFromJson(json);
  }

  const UserServiceLoginDTO({
    required this.user,
    required this.token,
  });

  final UserServiceLoginDTOUser user;

  @JsonKey(name: 'token')
  final String token;
}

@JsonSerializable()
final class UserServiceLoginDTOUser {
  static UserServiceLoginDTOUser fromJson(Map<String, dynamic> json) {
    return _$UserServiceLoginDTOUserFromJson(json);
  }

  const UserServiceLoginDTOUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.referralCode,
  });

  final String id;

  final String name;

  final String email;

  final String phone;

  @JsonKey(name: 'referral_code')
  final String referralCode;
}
