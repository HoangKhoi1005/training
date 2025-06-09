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
