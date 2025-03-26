// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserServiceLoginDTO _$UserServiceLoginDTOFromJson(Map<String, dynamic> json) =>
    UserServiceLoginDTO(
      user: UserServiceLoginDTOUser.fromJson(
          json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserServiceLoginDTOToJson(
        UserServiceLoginDTO instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserServiceLoginDTOUser _$UserServiceLoginDTOUserFromJson(
        Map<String, dynamic> json) =>
    UserServiceLoginDTOUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      referralCode: json['referral_code'] as String,
    );

Map<String, dynamic> _$UserServiceLoginDTOUserToJson(
        UserServiceLoginDTOUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'referral_code': instance.referralCode,
    };
