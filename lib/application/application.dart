library application;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'navigation/router.dart';

part 'screen/account/screen.dart';
part 'screen/home/screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Training',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: $router,
    );
  }
}
