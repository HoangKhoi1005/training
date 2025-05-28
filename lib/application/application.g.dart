// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $loginRoute,
      $forgotPasswordRoute,
      $signUpRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'account',
          factory: $AccountRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'tools/:toolName',
          factory: $StoreListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'tools/:toolName/prix/stores/:storeId',
          factory: $StorePrixDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'tools/:toolName/rupture/stores/:storeId',
          factory: $StoreRuptureDetailRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteExtension on AccountRoute {
  static AccountRoute _fromState(GoRouterState state) => const AccountRoute();

  String get location => GoRouteData.$location(
        '/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StoreListRouteExtension on StoreListRoute {
  static StoreListRoute _fromState(GoRouterState state) => StoreListRoute(
        toolName: state.pathParameters['toolName']!,
      );

  String get location => GoRouteData.$location(
        '/tools/${Uri.encodeComponent(toolName)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StorePrixDetailRouteExtension on StorePrixDetailRoute {
  static StorePrixDetailRoute _fromState(GoRouterState state) =>
      StorePrixDetailRoute(
        storeId: int.parse(state.pathParameters['storeId']!)!,
        toolName: state.pathParameters['toolName']!,
        $extra: state.extra as Store?,
      );

  String get location => GoRouteData.$location(
        '/tools/${Uri.encodeComponent(toolName)}/prix/stores/${Uri.encodeComponent(storeId.toString())}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $StoreRuptureDetailRouteExtension on StoreRuptureDetailRoute {
  static StoreRuptureDetailRoute _fromState(GoRouterState state) =>
      StoreRuptureDetailRoute(
        storeId: int.parse(state.pathParameters['storeId']!)!,
        toolName: state.pathParameters['toolName']!,
      );

  String get location => GoRouteData.$location(
        '/tools/${Uri.encodeComponent(toolName)}/rupture/stores/${Uri.encodeComponent(storeId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $forgotPasswordRoute => GoRouteData.$route(
      path: '/forgot-password',
      factory: $ForgotPasswordRouteExtension._fromState,
    );

extension $ForgotPasswordRouteExtension on ForgotPasswordRoute {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      const ForgotPasswordRoute();

  String get location => GoRouteData.$location(
        '/forgot-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signUpRoute => GoRouteData.$route(
      path: '/sign-up',
      factory: $SignUpRouteExtension._fromState,
    );

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => SignUpRoute(
        firstName: state.uri.queryParameters['first-name'],
        lastName: state.uri.queryParameters['last-name'],
        email: state.uri.queryParameters['email'],
      );

  String get location => GoRouteData.$location(
        '/sign-up',
        queryParams: {
          if (firstName != null) 'first-name': firstName,
          if (lastName != null) 'last-name': lastName,
          if (email != null) 'email': email,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
