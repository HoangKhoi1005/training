part of my_domain;

abstract class MissionRepository {
  const MissionRepository();

  Future<List<Mission>> getMissions(String storeName, String toolName);
}