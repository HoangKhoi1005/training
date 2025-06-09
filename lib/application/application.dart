library application;

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training/data/data.dart';
import 'package:training/domain/domain.dart';

part 'application.g.dart';

part 'navigation/dashboard.dart';
part 'navigation/onboarding.dart';
part 'navigation/router.dart';

part 'screen/account/screen.dart';
part 'screen/home/widget/tool_card.dart';
part 'screen/home/screen.dart';
part 'screen/login/screen.dart';
part 'screen/forgot_password/screen.dart';
part 'screen/sign_up/screen.dart';
part 'screen/store_list/widget/category_helper.dart';
part 'screen/store_list/widget/store_card.dart';
part 'screen/store_list/widget/store_list_view.dart';
part 'screen/store_list/screen.dart';
part 'screen/store_prix_detail/widget/mission_card.dart';
part 'screen/store_prix_detail/screen.dart';
part 'screen/store_rupture_detail/screen.dart';

part 'asset.dart';
part 'manager.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final mainColor = Color(0xFFA271E1);
    final colorScheme = ColorScheme.fromSeed(seedColor: mainColor);
    final primaryColor = colorScheme.primary;
    return MaterialApp.router(
      title: 'Training',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE2E7EA),
        colorScheme: colorScheme,
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: primaryColor,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: primaryColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: primaryColor,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
            shape: const StadiumBorder(),
          ),
        ),
      ),
      routerConfig: $router,
    );
  }
}
