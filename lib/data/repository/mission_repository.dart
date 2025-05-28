part of my_data;

class MissionRepositoryImpl implements MissionRepository {
  @override
  Future<List<Mission>> getMissions(String storeName, String toolName) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Mission(
        name: 'Nom de la mission',
        createdAt: DateTime(2022, 3, 24),
        endAt: DateTime(2023, 9, 30),
        sendingCount: 2,
        status: MissionStatus.enCours,
      ),
      Mission(
        name: 'Nom de la mission',
        createdAt: DateTime(2022, 3, 24),
        endAt: DateTime(2023, 9, 30),
        sendingCount: 2,
        status: MissionStatus.enCours,
      ),
    ];
  }
}
