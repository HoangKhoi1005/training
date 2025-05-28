part of my_domain;

interface class Store {
  final int storeId;
  final String name;
  final String logoPath;
  final double distanceKm;
  final String address;
  final StoreCategory category;
  final int notificationCount;
  final bool isFavorite;

  const Store({
    required this.storeId,
    required this.name,
    required this.logoPath,
    required this.distanceKm,
    required this.address,
    required this.category,
    required this.notificationCount,
    required this.isFavorite,
  });

  Store copyWith({
    int? storeId,
    String? name,
    String? logoPath,
    double? distanceKm,
    String? address,
    StoreCategory? category,
    int? notificationCount,
    bool? isFavorite,
  }) {
    return Store(
      storeId: storeId ?? this.storeId,
      name: name ?? this.name,
      logoPath: logoPath ?? this.logoPath,
      distanceKm: distanceKm ?? this.distanceKm,
      address: address ?? this.address,
      category: category ?? this.category,
      notificationCount: notificationCount ?? this.notificationCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
