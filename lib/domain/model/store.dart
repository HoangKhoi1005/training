part of my_domain;

interface class Store {
  final String name;
  final String logoPath;
  final double distanceKm;
  final String address;
  final StoreCategory category;
  final int notificationCount;
  final bool isFavorite;

  const Store({
    required this.name,
    required this.logoPath,
    required this.distanceKm,
    required this.address,
    required this.category,
    required this.notificationCount,
    required this.isFavorite,
  });
}