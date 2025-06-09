import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training/application/application.dart';
import 'package:training/domain/domain.dart';

void main() {
  final testStore = Store(
    storeId: 1,
    name: 'Test Store',
    logoPath: 'assets/images/store.png',
    distanceKm: 3.2,
    address: '456 Market St',
    category: StoreCategory.superette,
    notificationCount: 2,
    isFavorite: false,
  );

  group('StoreCard', () {
    group('renders', () {
      testWidgets('displays store name, address, and distance', (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: StoreCard(
              store: testStore,
              toolName: 'Prix',
              isFavorite: testStore.isFavorite,
              onFavoriteToggle: () {},
            ),
          ),
        ));

        expect(find.text('Test Store'), findsOneWidget);
        expect(find.text('456 Market St'), findsOneWidget);
        expect(find.textContaining('3.2 km'), findsOneWidget);
      });

      testWidgets('shows notification badge when notificationCount > 0',
          (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: StoreCard(
              store: testStore,
              toolName: 'Rupture',
              isFavorite: testStore.isFavorite,
              onFavoriteToggle: () {},
            ),
          ),
        ));

        expect(find.text('2'), findsOneWidget);
      });

      testWidgets('does not show notification badge when notificationCount 0',
          (tester) async {
        final storeWithoutNotification =
            testStore.copyWith(notificationCount: 0);

        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: StoreCard(
              store: storeWithoutNotification,
              toolName: 'Rupture',
              isFavorite: storeWithoutNotification.isFavorite,
              onFavoriteToggle: () {},
            ),
          ),
        ));

        expect(find.text('2'), findsNothing);
      });

      testWidgets('displays correct category label', (tester) async {
        final store = testStore.copyWith(category: StoreCategory.superette);
        final expectedLabel = CategoryHelper.label(StoreCategory.superette);

        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: StoreCard(
              store: store,
              toolName: 'Prix',
              isFavorite: false,
              onFavoriteToggle: () {},
            ),
          ),
        ));

        expect(find.text(expectedLabel), findsOneWidget);
      });
    });

    group('interactions', () {
      testWidgets('updates icon when isFavorite changes', (tester) async {
        var isFavorite = false;

        await tester.pumpWidget(
          StatefulBuilder(builder: (_, setState) {
            return MaterialApp(
              home: Material(
                child: StoreCard(
                  store: testStore,
                  toolName: 'Prix',
                  isFavorite: isFavorite,
                  onFavoriteToggle: () {
                    setState(() => isFavorite = !isFavorite);
                  },
                ),
              ),
            );
          }),
        );

        expect(find.byIcon(Icons.favorite_border), findsOneWidget);

        await tester.tap(find.byIcon(Icons.favorite_border));
        await tester.pump();

        expect(find.byIcon(Icons.favorite), findsOneWidget);
      });

      testWidgets('calls onFavoriteToggle when heart icon is tapped',
          (tester) async {
        var toggleCalled = false;

        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: StoreCard(
              store: testStore,
              toolName: 'Prix',
              isFavorite: false,
              onFavoriteToggle: () {
                toggleCalled = true;
              },
            ),
          ),
        ));

        await tester.tap(find.byIcon(Icons.favorite_border));
        await tester.pump();
        expect(toggleCalled, isTrue);
      });
    });
  });
}
