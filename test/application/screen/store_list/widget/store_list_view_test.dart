import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training/application/application.dart';
import 'package:training/domain/domain.dart';

void main() {
  final store1 = Store(
    storeId: 1,
    name: 'Store A',
    logoPath: 'assets/images/store.png',
    distanceKm: 2.5,
    address: '123 Main St',
    category: StoreCategory.superette,
    notificationCount: 0,
    isFavorite: true,
  );

  final store2 = Store(
    storeId: 2,
    name: 'Store B',
    logoPath: 'assets/images/store.png',
    distanceKm: 4.1,
    address: '789 Elm St',
    category: StoreCategory.superette,
    notificationCount: 1,
    isFavorite: false,
  );

  final store3 = Store(
    storeId: 3,
    name: 'Store C',
    logoPath: 'assets/images/store.png',
    distanceKm: 1.0,
    address: '456 Oak St',
    category: StoreCategory.superette,
    notificationCount: 0,
    isFavorite: true,
  );

  group('StoreListView', () {
    late ApplicationManager applicationManager;

    setUp(() {
      applicationManager = ApplicationManager();
      applicationManager.addFavoriteStore(store1);
      applicationManager.addFavoriteStore(store3);
    });

    testWidgets('Counts items correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StoreListView(
              toolName: 'Prix',
              items: [store1, store2, store3],
              isFavorite: true,
              applicationManager: applicationManager,
              toggleFavorite: (_) {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StoreCard), findsNWidgets(2));
    });

    testWidgets('displays all stores when isFavorite is false', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: StoreListView(
            toolName: 'Prix',
            items: [store1, store2],
            isFavorite: false,
            applicationManager: applicationManager,
            toggleFavorite: (_) {},
          ),
        ),
      ));

      expect(find.text('Store A'), findsOneWidget);
      expect(find.text('Store B'), findsOneWidget);
    });

    testWidgets('filters favorite stores when isFavorite is true',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: StoreListView(
            toolName: 'Prix',
            items: [store1, store2],
            isFavorite: true,
            applicationManager: applicationManager,
            toggleFavorite: (_) {},
          ),
        ),
      ));

      expect(find.text('Store A'), findsOneWidget);
      expect(find.text('Store B'), findsNothing);
    });

    testWidgets('calls toggleFavorite when heart icon tapped', (tester) async {
      bool toggleCalled = false;

      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: StoreListView(
            toolName: 'Prix',
            items: [store2],
            isFavorite: false,
            applicationManager: applicationManager,
            toggleFavorite: (_) {
              toggleCalled = true;
            },
          ),
        ),
      ));

      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      expect(toggleCalled, isTrue);
    });

    testWidgets('shows empty message when no items', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: StoreListView(
          toolName: 'Prix',
          items: [],
          isFavorite: false,
          applicationManager: applicationManager,
          toggleFavorite: (_) {},
        ),
      ));

      expect(find.text('Aucun élément trouvé'), findsOneWidget);
    });
  });
}
