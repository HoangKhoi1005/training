part of my_domain;

@freezed
interface class Store with _$Store {
  @override
  final int storeId;

  @override
  final String name;

  @override
  final String logoPath;

  @override
  final double distanceKm;

  @override
  final String address;

  @override
  final StoreCategory category;

  @override
  final int notificationCount;

  @override
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

  Map<String, dynamic> toJson() {
    return {
      'storeId': storeId,
      'name': name,
      'logoPath': logoPath,
      'distanceKm': distanceKm,
      'address': address,
      'category': category.toString(),
      'notificationCount': notificationCount,
      'isFavorite': isFavorite,
    };
  }

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      storeId: json['storeId'] as int,
      name: json['name'] as String,
      logoPath: json['logoPath'] as String,
      distanceKm: (json['distanceKm'] as num).toDouble(),
      address: json['address'] as String,
      category: StoreCategory.values.firstWhere(
        (e) => e.toString() == 'StoreCategory.${json['category']}',
        orElse: () => StoreCategory.superette,
      ),
      notificationCount: json['notificationCount'] as int,
      isFavorite: json['isFavorite'] as bool,
    );
  }
}
