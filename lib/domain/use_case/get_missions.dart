part of my_domain;

final class GetMissionsUseCase {
  final MissionRepository missionRepository;

  const GetMissionsUseCase({required this.missionRepository});

  Future<List<Mission>> call(String storeName, String toolName) =>
      missionRepository.getMissions(storeName, toolName);
}