// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mission _$MissionFromJson(Map<String, dynamic> json) => Mission(
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      endAt: DateTime.parse(json['end_at'] as String),
      status: $enumDecode(_$MissionStatusEnumMap, json['status']),
      sendingCount: (json['sending_count'] as num).toInt(),
    );

Map<String, dynamic> _$MissionToJson(Mission instance) => <String, dynamic>{
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'end_at': instance.endAt.toIso8601String(),
      'status': _$MissionStatusEnumMap[instance.status]!,
      'sending_count': instance.sendingCount,
    };

const _$MissionStatusEnumMap = {
  MissionStatus.disponible: 'disponible',
  MissionStatus.enCours: 'enCours',
  MissionStatus.expiree: 'expiree',
};
