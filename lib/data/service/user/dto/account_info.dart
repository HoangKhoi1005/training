part of my_data;

@JsonSerializable()
final class UserServiceAccountInfoDTO {
  static UserServiceAccountInfoDTO fromJson(Map<String, dynamic> json) {
    return _$UserServiceAccountInfoDTOFromJson(json);
  }

  const UserServiceAccountInfoDTO({
    required this.user,
  });

  final UserServiceAccountInfoDTOUser user;
}

@JsonSerializable()
final class UserServiceAccountInfoDTOUser {
  static UserServiceAccountInfoDTOUser fromJson(Map<String, dynamic> json) {
    return _$UserServiceAccountInfoDTOUserFromJson(json);
  }

  const UserServiceAccountInfoDTOUser({
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
