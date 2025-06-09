part of my_domain;

class Mission {
  final String name;
  final DateTime createdAt;
  final DateTime endAt;
  final MissionStatus status;
  final int sendingCount;

  const Mission({
    required this.name,
    required this.createdAt,
    required this.endAt,
    required this.status,
    required this.sendingCount,
  });

  Mission copyWith({
    String? name,
    DateTime? createdAt,
    DateTime? endAt,
    MissionStatus? status,
    int? sendingCount,
  }) {
    return Mission(
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      endAt: endAt ?? this.endAt,
      status: status ?? this.status,
      sendingCount: sendingCount ?? this.sendingCount,
    );
  }

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
