part of my_data;

final class StoreRepositoryImpl implements StoreRepository {
  @override
  Future<List<Store>> getStores(String toolName) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      Store(
        name: "Carrefour Express Paris 11",
        address: "Paris (75011 Paris)",
        distanceKm: 2.12,
        logoPath: "assets/images/express.png",
        category: StoreCategory.supermarche,
        notificationCount: 2,
        isFavorite: true,
      ),
      Store(
        name: "E.leclerc Pantin",
        address: "Pantin (93503 Paris)",
        distanceKm: 3.52,
        logoPath: "assets/images/leclerc.png",
        category: StoreCategory.hypermarche,
        notificationCount: 2,
        isFavorite: false,
      ),
      Store(
        name: "Naturalia Crussol",
        address: "Pantin (93503 Paris)",
        distanceKm: 4.12,
        logoPath: "assets/images/naturalia.png",
        category: StoreCategory.superette,
        notificationCount: 1,
        isFavorite: false,
      ),
      Store(
        name: "Monoprix Paris Gongourt",
        address: "Pantin (93503 Paris)",
        distanceKm: 7.12,
        logoPath: "assets/images/express.png",
        category: StoreCategory.hypermarche,
        notificationCount: 1,
        isFavorite: false,
      ),
    ];
  }
}
