part of my_domain;

@JsonSerializable()
@freezed
interface class Mission with _$Mission {
  @JsonKey(name: 'name')
  @override
  final String name;

  @JsonKey(name: 'created_at')
  @override
  final DateTime createdAt;

  @JsonKey(name: 'end_at')
  @override
  final DateTime endAt;

  @JsonKey(name: 'status')
  @override
  final MissionStatus status;

  @JsonKey(name: 'sending_count')
  @override
  final int sendingCount;

  const Mission({
    required this.name,
    required this.createdAt,
    required this.endAt,
    required this.status,
    required this.sendingCount,
  });

  Map<String, dynamic> toJson() => _$MissionToJson(this);

  factory Mission.fromJson(Map<String, dynamic> json) {
    return _$MissionFromJson(json);
  }
}
