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
}
