import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training/application/application.dart';

void main() {
  group('StoreListScreen UI tests', () {
    testWidgets('Loading indicator shows while loading', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: StoreListScreen(toolName: 'TestTool'),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets('Display correct UI after loading stores', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: StoreListScreen(toolName: 'TestTool'),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, Colors.white);

      final backIconButton =
          find.widgetWithIcon(IconButton, Icons.arrow_back_ios);
      expect(backIconButton, findsOneWidget);
      final icon = find.descendant(
        of: backIconButton,
        matching: find.byType(Icon),
      );

      final backIcon = tester.widget<Icon>(icon);
      expect(backIcon.color, appBar.titleTextStyle?.color ?? backIcon.color);

      final container = tester.widget<Container>(find.ancestor(
        of: find.byType(TabBar),
        matching: find.byType(Container),
      ));
      expect(container.constraints?.maxHeight ?? 0, 32);
      final padding = container.padding as EdgeInsets?;
      expect(padding, const EdgeInsets.all(4));

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color(0xFFF0F0F0));
      expect(decoration.borderRadius, BorderRadius.circular(8));

      final tabs = tester.widgetList<Tab>(find.byType(Tab)).toList();
      expect(tabs.length, 2);
      expect(tabs[0].text, contains('Missions'));
      expect(tabs[1].text, contains('Favoris'));

      final tabBar = tester.widget<TabBar>(find.byType(TabBar));
      final indicatorDecoration = tabBar.indicator as BoxDecoration;
      expect(indicatorDecoration.color, Colors.white);
      expect(indicatorDecoration.borderRadius, BorderRadius.circular(7));
      expect(indicatorDecoration.boxShadow?.length, 1);
      expect(indicatorDecoration.boxShadow?.first.color,
          Colors.black.withOpacity(0.2));
      expect(indicatorDecoration.boxShadow?.first.spreadRadius, 1);
      expect(indicatorDecoration.boxShadow?.first.blurRadius, 4);
      expect(indicatorDecoration.boxShadow?.first.offset, const Offset(0, 2));

      final toolText = find.text('Outil TestTool');
      expect(toolText, findsOneWidget);
      final textWidget = tester.widget<Text>(toolText);
      expect(textWidget.style?.fontSize, 28);
      expect(textWidget.style?.fontWeight, FontWeight.w700);

      final searchIconButton = find.widgetWithIcon(IconButton, Icons.search);
      expect(searchIconButton, findsOneWidget);
      final searchIcon = tester.widget<Icon>(
        find.descendant(
            of: find.widgetWithIcon(IconButton, Icons.search),
            matching: find.byType(Icon)),
      );
      expect(searchIcon.size, 32);

      final tabBarView = find.byType(TabBarView);
      expect(tabBarView, findsOneWidget);
      expect(tester.widget<TabBarView>(tabBarView).children.length, 2);
    });
  });
}
