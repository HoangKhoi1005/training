part of my_domain;

@freezed
interface class Mission with _$Mission {
  @override
  final String name;

  @override
  final DateTime createdAt;

  @override
  final DateTime endAt;

  @override
  final MissionStatus status;

  @override
  final int sendingCount;

  const Mission({
    required this.name,
    required this.createdAt,
    required this.endAt,
    required this.status,
    required this.sendingCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'endAt': endAt.toIso8601String(),
      'status': status.toString(),
      'sendingCount': sendingCount,
    };
  }

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      endAt: DateTime.parse(json['endAt'] as String),
      status: MissionStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => MissionStatus.disponible,
      ),
      sendingCount: json['sendingCount'] as int,
    );
  }
}
