part of application;

final $router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return LoginScreen();
      },
      routes: [
        ///
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomeScreen();
      },
      routes: [
        ///
      ],
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) {
        return AccountScreen();
      },
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            return AccountScreen();
          },
          routes: [
            ///
          ],
        ),
      ],
    ),

    ///
  ],
);
