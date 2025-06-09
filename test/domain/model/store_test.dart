import 'package:flutter_test/flutter_test.dart';
import 'package:training/domain/domain.dart';

void main() {
  group('StoreEntity', () {
    final storeId = 1;
    final storeName = 'Test Store';
    final storeLogoPath = 'assets/images/store.png';
    final storeDistanceKm = 3.2;
    final storeAddress = '456 Market St';
    final storeCategory = StoreCategory.superette;
    final storeNotificationCount = 2;
    final storeIsFavorite = false;

    group('contructor', () {
      test('should create a Store object with valid values', () {
        final store = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        expect(store.storeId, 1);
        expect(store.name, 'Test Store');
        expect(store.logoPath, 'assets/images/store.png');
        expect(store.distanceKm, 3.2);
        expect(store.address, '456 Market St');
        expect(store.category, StoreCategory.superette);
        expect(store.notificationCount, 2);
        expect(store.isFavorite, false);
      });
    });

    group('equality', () {
      test('should be equal with another Store with same values', () {
        final store1 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );
        expect(store1, store2);
      });
      test('should not be equal with another Store with different values', () {
        final store1 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: 2,
          name: 'Another Store',
          logoPath: 'assets/images/another_store.png',
          distanceKm: 5.0,
          address: '789 Another St',
          category: StoreCategory.superette,
          notificationCount: 0,
          isFavorite: true,
        );

        expect(store1, isNot(equals(store2)));
      });

      test('should not be equal with another Store with different name', () {
        final store1 = Store(
          storeId: storeId,
          name: 'Test Store',
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: storeId,
          name: 'Different Store',
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        expect(store1, isNot(equals(store2)));
      });

      test('should not be equal with another Store with different storeId', () {
        final store1 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: 2, // Different ID
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        expect(store1, isNot(equals(store2)));
      });
      test('should not be equal with another Store with different logoPath',
          () {
        final store1 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: 'assets/images/different_store.png', // Different logo path
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        expect(store1, isNot(equals(store2)));
      });
      test('should not be equal with another Store with different distanceKm',
          () {
        final store1 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: 10.0, // Different distance
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        expect(store1, isNot(equals(store2)));
      });
      test('should not be equal with another Store with different address', () {
        final store1 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: '789 Different St', // Different address
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        expect(store1, isNot(equals(store2)));
      });
      test('should not be equal with another Store with different category',
          () {
        final store1 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: StoreCategory.superette, // Same category
          notificationCount: storeNotificationCount,
          isFavorite: true, // Different favorite status
        );

        expect(store1, isNot(equals(store2)));
      });
      test(
          'should not be equal with another Store with different notificationCount',
          () {
        final store1 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final store2 = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: 5, // Different notification count
          isFavorite: storeIsFavorite,
        );

        expect(store1, isNot(equals(store2)));
      });
    });
    group('copyWith', () {
      test('should update specified fields', () {
        final store = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final updatedStore = store.copyWith(
          storeId: 2,
          name: 'Updated Store',
          logoPath: 'assets/images/updated.png',
          distanceKm: 5.0,
          address: '789 Updated St',
          category: StoreCategory.hypermarche,
          notificationCount: 10,
          isFavorite: true,
        );

        expect(updatedStore.storeId, 2);
        expect(updatedStore.name, 'Updated Store');
        expect(updatedStore.logoPath, 'assets/images/updated.png');
        expect(updatedStore.distanceKm, 5.0);
        expect(updatedStore.address, '789 Updated St');
        expect(updatedStore.category, StoreCategory.hypermarche);
        expect(updatedStore.notificationCount, 10);
        expect(updatedStore.isFavorite, true);
      });

      test('should keep unspecified fields', () {
        final store = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final updatedStore = store.copyWith();

        expect(updatedStore.storeId, equals(store.storeId));
        expect(updatedStore.name, equals(store.name));
        expect(updatedStore.logoPath, equals(store.logoPath));
        expect(updatedStore.distanceKm, equals(store.distanceKm));
        expect(updatedStore.address, equals(store.address));
        expect(updatedStore.category, equals(store.category));
        expect(updatedStore.notificationCount, equals(store.notificationCount));
        expect(updatedStore.isFavorite, equals(store.isFavorite));
      });
    });

    group('serialization', () {
      test('should convert from and to JSON correctly', () {
        final store = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final json = store.toJson();
        final fromJson = Store.fromJson(json);
        expect(fromJson.storeId, store.storeId);
        expect(fromJson.name, store.name);
        expect(fromJson.logoPath, store.logoPath);
        expect(fromJson.distanceKm, store.distanceKm);
        expect(fromJson.address, store.address);
        expect(fromJson.category, store.category);
        expect(fromJson.notificationCount, store.notificationCount);
        expect(fromJson.isFavorite, store.isFavorite);
      });

      test('should support backwards compatibility', () {
        final store = Store(
          storeId: storeId,
          name: storeName,
          logoPath: storeLogoPath,
          distanceKm: storeDistanceKm,
          address: storeAddress,
          category: storeCategory,
          notificationCount: storeNotificationCount,
          isFavorite: storeIsFavorite,
        );

        final json = {
          'storeId': store.storeId,
          'name': store.name,
          'logoPath': store.logoPath,
          'distanceKm': store.distanceKm,
          'address': store.address,
          'category': store.category.toString(),
          'notificationCount': store.notificationCount,
          'isFavorite': store.isFavorite,
        };

        final fromJson = Store.fromJson(json);
        expect(fromJson.storeId, store.storeId);
        expect(fromJson.name, store.name);
        expect(fromJson.logoPath, store.logoPath);
        expect(fromJson.distanceKm, store.distanceKm);
        expect(fromJson.address, store.address);
        expect(fromJson.category, store.category);
        expect(fromJson.notificationCount, store.notificationCount);
        expect(fromJson.isFavorite, store.isFavorite);
      });
    });
  });
}
