// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserServiceAccountInfoDTO _$UserServiceAccountInfoDTOFromJson(
        Map<String, dynamic> json) =>
    UserServiceAccountInfoDTO(
      user: UserServiceAccountInfoDTOUser.fromJson(
          json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserServiceAccountInfoDTOToJson(
        UserServiceAccountInfoDTO instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserServiceAccountInfoDTOUser _$UserServiceAccountInfoDTOUserFromJson(
        Map<String, dynamic> json) =>
    UserServiceAccountInfoDTOUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      referralCode: json['referral_code'] as String,
    );

Map<String, dynamic> _$UserServiceAccountInfoDTOUserToJson(
        UserServiceAccountInfoDTOUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'referral_code': instance.referralCode,
    };

UserServiceLoginDTO _$UserServiceLoginDTOFromJson(Map<String, dynamic> json) =>
    UserServiceLoginDTO(
      user: UserServiceLoginDTOUser.fromJson(
          json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserServiceLoginDTOToJson(
        UserServiceLoginDTO instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
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
